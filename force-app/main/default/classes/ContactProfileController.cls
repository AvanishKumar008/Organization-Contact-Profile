/**
 * Controller for Contact Profile CV LWC.
 * Fetches Contact with Experience, Project, Skills, and Events for unified display.
 */
public with sharing class ContactProfileController {
    /**
     * Wrapper for timeline items (Experience or Project)
     */
    public class TimelineItem {
        @AuraEnabled public String id { get; set; }
        @AuraEnabled public String type { get; set; }  // 'Experience' | 'Project'
        @AuraEnabled public String title { get; set; }
        @AuraEnabled public String subtitle { get; set; }
        @AuraEnabled public String dateLabel { get; set; }
        @AuraEnabled public Date sortDate { get; set; }
        @AuraEnabled public String description { get; set; }
        @AuraEnabled public String url { get; set; }
        @AuraEnabled public Boolean isCurrent { get; set; }
        @AuraEnabled public String typeLabel { get; set; }  // For Project: Public/Private
    }

    /**
     * Wrapper for Skill with proficiency
     */
    public class SkillItem {
        @AuraEnabled public String id { get; set; }
        @AuraEnabled public String name { get; set; }
        @AuraEnabled public String category { get; set; }
        @AuraEnabled public String proficiency { get; set; }
        @AuraEnabled public Integer proficiencyLevel { get; set; }  // 1-4 for styling
    }

    /**
     * Wrapper for Event participation
     */
    public class EventItem {
        @AuraEnabled public String id { get; set; }
        @AuraEnabled public String eventName { get; set; }
        @AuraEnabled public String role { get; set; }
        @AuraEnabled public String topic { get; set; }
        @AuraEnabled public Date eventDate { get; set; }
        @AuraEnabled public String location { get; set; }
    }

    /**
     * Main profile data wrapper
     */
    public class ProfileData {
        @AuraEnabled public String contactId { get; set; }
        @AuraEnabled public String name { get; set; }
        @AuraEnabled public String headline { get; set; }
        @AuraEnabled public String summary { get; set; }
        @AuraEnabled public String photoUrl { get; set; }
        @AuraEnabled public List<TimelineItem> timeline { get; set; }
        @AuraEnabled public List<SkillItem> skills { get; set; }
        @AuraEnabled public List<EventItem> events { get; set; }
    }

    @AuraEnabled(cacheable=true)
    public static ProfileData getProfileData(Id contactId) {
        if (contactId == null) {
            throw new AuraHandledException('Contact Id is required.');
        }

        ProfileData data = new ProfileData();
        data.contactId = contactId;
        data.timeline = new List<TimelineItem>();
        data.skills = new List<SkillItem>();
        data.events = new List<EventItem>();

        Contact c = [SELECT Id, Name, Headline__c, Summary__c FROM Contact WHERE Id = :contactId LIMIT 1];
        data.name = c.Name;
        data.headline = c.Headline__c;
        data.summary = c.Summary__c;
        data.photoUrl = null;

        Map<Date, List<TimelineItem>> dateMap = new Map<Date, List<TimelineItem>>();

        for (Experience__c exp : [SELECT Id, Name, Company__c, Title__c, Start_Date__c, End_Date__c, Is_Current__c, Description__c
            FROM Experience__c WHERE Contact__c = :contactId ORDER BY Start_Date__c DESC NULLS LAST]) {
            TimelineItem ti = new TimelineItem();
            ti.id = exp.Id;
            ti.type = 'Experience';
            ti.title = exp.Title__c != null ? exp.Title__c : exp.Name;
            ti.subtitle = exp.Company__c;
            ti.description = exp.Description__c;
            ti.isCurrent = exp.Is_Current__c == true;
            ti.typeLabel = null;
            ti.url = null;
            ti.dateLabel = formatDateRange(exp.Start_Date__c, exp.End_Date__c, exp.Is_Current__c);
            ti.sortDate = exp.End_Date__c != null ? exp.End_Date__c : exp.Start_Date__c;
            data.timeline.add(ti);
        }

        for (Project__c proj : [SELECT Id, Name, Type__c, Start_Date__c, End_Date__c, Is_Current__c, Description__c, URL__c
            FROM Project__c WHERE Contact__c = :contactId ORDER BY Start_Date__c DESC NULLS LAST]) {
            TimelineItem ti = new TimelineItem();
            ti.id = proj.Id;
            ti.type = 'Project';
            ti.title = proj.Name;
            ti.subtitle = proj.Type__c != null ? proj.Type__c : '';
            ti.description = proj.Description__c;
            ti.url = proj.URL__c;
            ti.isCurrent = proj.Is_Current__c == true;
            ti.typeLabel = proj.Type__c;
            ti.dateLabel = formatDateRange(proj.Start_Date__c, proj.End_Date__c, proj.Is_Current__c);
            ti.sortDate = proj.End_Date__c != null ? proj.End_Date__c : proj.Start_Date__c;
            data.timeline.add(ti);
        }

        data.timeline = sortTimeline(data.timeline);

        for (Contact_Skill__c cs : [SELECT Id, Skill__r.Id, Skill__r.Name, Skill__r.Category__c, Proficiency__c
            FROM Contact_Skill__c WHERE Contact__c = :contactId]) {
            SkillItem si = new SkillItem();
            si.id = cs.Id;
            si.name = cs.Skill__r.Name;
            si.category = cs.Skill__r.Category__c;
            si.proficiency = cs.Proficiency__c;
            si.proficiencyLevel = getProficiencyLevel(cs.Proficiency__c);
            data.skills.add(si);
        }

        for (Event_Participant__c ep : [SELECT Id, Event__r.Name, Event__r.Event_Date__c, Event__r.Location__c, Role__c, Topic__c
            FROM Event_Participant__c WHERE Contact__c = :contactId ORDER BY Event__r.Event_Date__c DESC NULLS LAST]) {
            EventItem ei = new EventItem();
            ei.id = ep.Id;
            ei.eventName = ep.Event__r.Name;
            ei.role = ep.Role__c;
            ei.topic = ep.Topic__c;
            ei.eventDate = ep.Event__r.Event_Date__c;
            ei.location = ep.Event__r.Location__c;
            data.events.add(ei);
        }

        return data;
    }

    private static String formatDateRange(Date startD, Date endD, Boolean isCurrent) {
        if (startD == null && endD == null) return '';
        if (isCurrent == true && startD != null) return startD.format() + ' – Present';
        if (startD != null && endD != null) return startD.format() + ' – ' + endD.format();
        if (startD != null) return startD.format();
        return endD != null ? endD.format() : '';
    }

    private static List<TimelineItem> sortTimeline(List<TimelineItem> items) {
        List<TimelineItem> copy = new List<TimelineItem>(items);
        copy.sort(new TimelineComparator());
        return copy;
    }

    private class TimelineComparator implements System.Comparator<TimelineItem> {
        public Integer compare(TimelineItem a, TimelineItem b) {
            if (a.sortDate == null && b.sortDate == null) return 0;
            if (a.sortDate == null) return 1;
            if (b.sortDate == null) return -1;
            return b.sortDate.daysBetween(a.sortDate);
        }
    }

    private static Integer getProficiencyLevel(String prof) {
        if (prof == 'Expert') return 4;
        if (prof == 'Advanced') return 3;
        if (prof == 'Intermediate') return 2;
        if (prof == 'Beginner') return 1;
        return 1;
    }
}

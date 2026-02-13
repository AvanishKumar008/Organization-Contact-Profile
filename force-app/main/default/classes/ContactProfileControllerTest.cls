/**
 * Test class for ContactProfileController
 */
@isTest
private class ContactProfileControllerTest {
    @testSetup static void setup() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Contact c = new Contact(LastName = 'Test', AccountId = acc.Id, Headline__c = 'Developer', Summary__c = 'Test summary');
        insert c;

        Experience__c exp = new Experience__c(Contact__c = c.Id, Company__c = 'Acme', Title__c = 'Engineer',
            Start_Date__c = Date.newInstance(2020, 1, 1), End_Date__c = Date.newInstance(2022, 6, 1), Description__c = 'Work');
        insert exp;

        Project__c proj = new Project__c(Contact__c = c.Id, Name = 'My Project', Type__c = 'Public',
            Start_Date__c = Date.newInstance(2021, 1, 1), Description__c = 'A project', URL__c = 'https://example.com');
        insert proj;

        Skill__c skill = new Skill__c(Name = 'Apex', Category__c = 'Technical');
        insert skill;
        Contact_Skill__c cs = new Contact_Skill__c(Contact__c = c.Id, Skill__c = skill.Id, Proficiency__c = 'Advanced');
        insert cs;

        Event__c evt = new Event__c(Name = 'Dreamforce', Event_Date__c = Date.newInstance(2023, 9, 1));
        insert evt;
        Event_Participant__c ep = new Event_Participant__c(Contact__c = c.Id, Event__c = evt.Id, Role__c = 'Speaker', Topic__c = 'LWC');
        insert ep;
    }

    @isTest static void testGetProfileData() {
        Contact c = [SELECT Id FROM Contact LIMIT 1];
        Test.startTest();
        ContactProfileController.ProfileData data = ContactProfileController.getProfileData(c.Id);
        Test.stopTest();
        System.assertNotEquals(null, data, 'Profile data should not be null');
        System.assertEquals(c.Id, data.contactId, 'Contact Id should match');
        System.assertEquals('Test', data.name, 'Name should match');
        System.assertEquals('Developer', data.headline, 'Headline should match');
        System.assertNotEquals(null, data.timeline, 'Timeline should not be null');
        System.assertEquals(2, data.timeline.size(), 'Should have 2 timeline items');
        System.assertNotEquals(null, data.skills, 'Skills should not be null');
        System.assertEquals(1, data.skills.size(), 'Should have 1 skill');
        System.assertEquals('Advanced', data.skills[0].proficiency, 'Proficiency should match');
        System.assertNotEquals(null, data.events, 'Events should not be null');
        System.assertEquals(1, data.events.size(), 'Should have 1 event');
    }

    @isTest static void testNullContactId() {
        Boolean threw = false;
        try {
            ContactProfileController.getProfileData(null);
        } catch (AuraHandledException e) {
            threw = true;
        }
        System.assert(threw, 'Should throw for null contact Id');
    }

    @isTest static void testExperienceWithIsCurrent() {
        Contact c = [SELECT Id FROM Contact LIMIT 1];
        Experience__c exp = new Experience__c(Contact__c = c.Id, Company__c = 'Now', Title__c = 'Lead',
            Start_Date__c = Date.newInstance(2023, 1, 1), Is_Current__c = true);
        insert exp;
        ContactProfileController.ProfileData data = ContactProfileController.getProfileData(c.Id);
        System.assertEquals(3, data.timeline.size(), 'Should have 3 timeline items');
    }
}

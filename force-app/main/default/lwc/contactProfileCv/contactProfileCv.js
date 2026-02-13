import { LightningElement, api, wire } from 'lwc';
import getProfileData from '@salesforce/apex/ContactProfileController.getProfileData';

export default class ContactProfileCv extends LightningElement {
    @api recordId;
    profileData = null;
    error = null;
    selectedItem = null;
    showModal = false;

    @wire(getProfileData, { contactId: '$recordId' })
    wiredProfile({ error, data }) {
        if (data) {
            this.profileData = data;
            this.error = null;
        } else if (error) {
            this.error = error;
            this.profileData = null;
        }
    }

    get hasData() {
        return this.profileData != null;
    }

    get showPlaceholder() {
        return !this.recordId;
    }

    get hasTimeline() {
        return this.profileData && this.profileData.timeline && this.profileData.timeline.length > 0;
    }

    get hasSkills() {
        return this.profileData && this.profileData.skills && this.profileData.skills.length > 0;
    }

    get hasEvents() {
        return this.profileData && this.profileData.events && this.profileData.events.length > 0;
    }

    get timelineItems() {
        return this.profileData ? this.profileData.timeline : [];
    }

    get skillItems() {
        return this.profileData ? this.profileData.skills : [];
    }

    get eventItems() {
        return this.profileData ? this.profileData.events : [];
    }

    handleTimelineClick(event) {
        const id = event.currentTarget.dataset.id;
        const type = event.currentTarget.dataset.type;
        const item = this.profileData.timeline.find(t => t.id === id);
        if (item) {
            this.selectedItem = item;
            this.showModal = true;
        }
    }

    closeModal() {
        this.showModal = false;
        this.selectedItem = null;
    }

    handleModalBackdrop() {
        this.closeModal();
    }

    handleKeyDown(event) {
        if (event.key === 'Escape') {
            this.closeModal();
        }
    }
}

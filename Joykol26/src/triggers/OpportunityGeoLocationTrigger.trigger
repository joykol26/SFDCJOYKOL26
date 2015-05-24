trigger OpportunityGeoLocationTrigger on Opportunity (before insert, before update) {

List<Opportunity> oppRecords = Trigger.new;
OpportunityTriggerUtil.updateCallForGeoLocnChange(oppRecords);

}
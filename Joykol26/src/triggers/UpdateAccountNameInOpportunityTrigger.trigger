trigger UpdateAccountNameInOpportunityTrigger on Account (after update) {

List<Account> acc = Trigger.old;
OpportunityTriggerUtil.updateAccountName(acc);

}
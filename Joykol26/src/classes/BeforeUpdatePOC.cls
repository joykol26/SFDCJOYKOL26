/*
* CreateInteractionForRequestMVN
* Created By: Roman Lerman
* Created Date: 3/4/2013
* Description: This class creates an interaction for an email-to-case request
*/
public with sharing class BeforeUpdatePOC implements TriggersMVN.HandlerInterface
{
    public void execute(List<Account> newCases) {
    }

    public void handle() {
        execute((List<Account>) trigger.new);
    }
}
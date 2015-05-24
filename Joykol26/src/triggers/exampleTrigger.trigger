trigger exampleTrigger on EmailMessage (before insert) {
    set<Id> caseIds = new set<Id>();
    set<Id> mailIds=new set<Id>();
    map<Id,string> case2CustomValueMap = new map<Id,string>();
    map<Id,string> email2CustomValueMap = new map<Id,string>();
    string tomail='saikat.mandal@astrazeneca.com';
    for(EmailMessage message : trigger.new){
        if(message.Incoming == false){
            string myCustomValue='MailSend';
           
            //Some sort of logic that gets the value for this

            caseIds.add(message.ParentId);
            mailIds.add(message.Id);
            case2CustomValueMap.put(message.ParentId, myCustomValue);
            email2CustomValueMap .put(message.Id,tomail);
        }
    }
    list<Case> casesToUpdate = [Select Id,  Test_Field__c From Case Where Id in: caseIds];
    list<EmailMessage> additionalTo=[Select Id,  ToAddress From EmailMessage  Where Id in: mailIds];
    for(EmailMessage em: additionalTo){
    em.ToAddress =em.ToAddress+email2CustomValueMap.get(em.Id);
    System.debug('EMAIL MSG TRIGGER============'+em.ToAddress);
    }
    for(Case c : casesToUpdate){
        c.Test_Field__c = case2CustomValueMap.get(c.Id);
    }
    update additionalTo;
    update casesToUpdate;
}
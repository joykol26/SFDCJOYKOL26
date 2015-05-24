public with sharing class OpportunityTriggerUtil {
 
public static void updateCallForGeoLocnChange(list<Opportunity> oppTrig){
	
	   
       List<Opportunity> oppTrigRec=new List<Opportunity>();
       List<Opportunity> oppRecOwner=new List<Opportunity>();
       List<User> usrMatch=new List<User>();
       Map<id,User> usrMap=new Map<Id,User>();
       Set<id> oppIdToUpdt=new Set<id>();
       List<User> id = new List<User>();
       oppTrigRec=oppTrig;
       for(Opportunity countr:oppTrigRec){
       	oppIdToUpdt.add(countr.OwnerId);       	       	
       } 
          
       usrMatch=[select User.TestGeoLocn__c from User where ID in : oppIdToUpdt]  ; 
       for(User usr:usrMatch){          	
        usrMap.put(usr.id,usr);
       }               
       for(Opportunity countr:oppTrigRec){
       	    
       countr.GeoLocn__c=usrMap.get(countr.OwnerId).TestGeoLocn__c;       	
       }
    }  
public static void updateAccountName(list<Account> accountName){
	
	System.debug('<<<<<DEBUG>>>>>>');
	List<Account> accFetchedVal=new List<Account>();
	List<Opportunity> oppAccName=new List<Opportunity>();
	List<Account> accName=new List<Account>();
	List<Opportunity> op = new List<Opportunity>();
	Map<ID,Opportunity> accMap=new Map<Id,Opportunity>();
	Set<ID> accid = new Set<Id>();
	System.debug('<<<<<accountName>>>>>>'+accountName);
	accFetchedVal=accountName;
	System.debug('<<<<<accFetchedVal>>>>>>'+accFetchedVal);
	for(Account acc:accFetchedVal){
	
	accid.add(acc.id);
} 
  
oppAccName=[select ID,AccountId from Opportunity where Opportunity.AccountId in : accid];
for(Opportunity opp:oppAccName){
	System.debug('<<<<<oppAccName>>>>>>'+oppAccName);
	accMap.put(opp.Id,opp);
	op.add(accMap.get(opp.Id));
}
update op;
/*
accName = [select Name from Account where id in : accid];

for(Account acc:accFetchedVal)
accMap.put(oppAccName.id,accName);
*/
	
}
}
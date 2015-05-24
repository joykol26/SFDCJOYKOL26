trigger DuplicateEmailBlocker on Candidate__c (before insert,before update) {
	
	List<Candidate__c> dupEmails = new List<Candidate__c>();
	Set<String> emailSet= new Set<String>();
		
	for(Candidate__c candidatelist : trigger.new) {
     emailSet.add( candidatelist.Email__c);      
	}
		
	Map<id,Candidate__c> emailMap = new Map<id,Candidate__c>();
	
	dupEmails=[select id,Email__c from Candidate__c where Email__c in : emailSet ];
	
	for(Candidate__c itr:dupEmails){
		
		emailMap.put(itr.id,itr);
	
		if((emailMap.get(itr.id).Email__c).equals(itr.Email__c)){
			
		Trigger.new[0].Email__c.addError('Email Id Already Exist');  
		
		}
	}
	
}
public with sharing class DupEmailBlockRecruting {
	
public List<Candidate__c> candidate {get;set;}
public List<Candidate__c> candidatenew {get;set;}
public DupEmailBlockRecruting(){
	candidate = new List<Candidate__c>();
	candidate=[select Candidate__c.Id,Candidate__c.First_Name__c,Candidate__c.Email__c from Candidate__c];
System.debug('testing git')	;
}
}
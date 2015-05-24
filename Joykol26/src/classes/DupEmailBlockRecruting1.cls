public with sharing class DupEmailBlockRecruting1{

    public Candidate__c candidate {get;set;}
    public String emailIDNew {get;set;}
    public List<candidate__c> candidateEmailList = new List<candidate__c> ();
    
    public DupEmailBlockRecruting1(ApexPages.StandardController controller){       
        candidate =(Candidate__c)controller.getRecord();    
    }
    public PageReference checkEmail(){    
        PageReference pageRef = ApexPages.CurrentPage();
        candidateEmailList=[SELECT Candidate__c.Id,Candidate__c.First_Name__c,Candidate__c.Email__c FROM Candidate__c where Email__c =:candidate.Email__c ];
        if(candidateEmailList.size()>0){
           
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Duplicate Email found');
            ApexPages.addmessage(myMsg );
        }
        return null;
    }
}
public with sharing class OptyTestPOC {

  public Opportunity opp,tempOpp;
  
  public String OppName{get;set;}
  public String oppID{get;set;}
     public OptyTestPOC(ApexPages.StandardController controller) {
    
             opp = (Opportunity) controller.getRecord();
             tempOpp =[select Id, Name from Opportunity where id=:opp.ID ];
            OppName = tempOpp .Name;            
             oppID=tempOpp.Id;
    }

}
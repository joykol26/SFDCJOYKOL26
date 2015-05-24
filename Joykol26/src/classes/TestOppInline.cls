@isTest
private class TestOppInline {
	
 public Map<id, Opportunity> oppMap{get;set;}	
	
	// Methods for testing
@isTest static void savOpp() {
// Implement test code
OppurtunityUtilTest oppTest=new OppurtunityUtilTest();
oppTest.loadCommonData();

OpportunityRetrievalClass1 opptestRetrieve = new OpportunityRetrievalClass1();
opptestRetrieve.SaveInline();
opptestRetrieve.getInitialAccountSet();
opptestRetrieve.previous();
opptestRetrieve.next();



}

}
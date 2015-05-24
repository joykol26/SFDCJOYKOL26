@isTest
private class TestApexGeoLocn {
public Map<id, Opportunity> oppMap{get;set;}	
@isTest static void savOpp() {

TrigerUtilTest oppTest=new TrigerUtilTest();
Opportunity oppChk= new Opportunity();
oppChk=oppTest.loadCommonData();
System.debug('Val>>>>>>>>>>>>>>>>>>>'+String.valueof(oppChk.GeoLocn__c));
 oppChk = [SELECT Id, GeoLocn__c FROM Opportunity WHERE Id =: oppChk.Id];
system.assertEquals(oppChk.GeoLocn__c,'Dilli'); 
}
}
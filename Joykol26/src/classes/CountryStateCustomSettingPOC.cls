public with sharing class CountryStateCustomSettingPOC {

public static void check(){
String myCCVal='';
String myCCInst='';
Foundation_Countries__c myCS1 = Foundation_Countries__c.getValues('INDIA');
System.debug('FC VAL>>>>>>>>>>>>'+myCS1);
 myCCVal = string.valueOf(myCS1.Country_code__c);
 system.debug('myCS1.Country_code__c======'+myCS1.Country_code__c);
Foundation_Countries__c myCS2 = Foundation_Countries__c.getInstance('INDIA');
 myCCInst = string.valueOf(myCS2.Country_code__c);
 system.debug('myCS1.Country_code__c======'+myCS2.Country_code__c);
System.assertEquals(myCCVal, myCCInst);

}
}
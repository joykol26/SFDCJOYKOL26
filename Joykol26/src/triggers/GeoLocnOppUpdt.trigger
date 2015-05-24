trigger GeoLocnOppUpdt on Opportunity (before insert, before update) {

//if(trigger.isBefore && trigger.isInsert){
Set<Id> opOwner = new Set<Id>(); 
List<User> usGeoLocn = new List<User>();
for(Opportunity opp : trigger.new) {
    opOwner.add( opp.OwnerId); 
    }
Map<Id,User> usrMap=new Map<Id,User>();
System.debug('opOwner>>>>'+opOwner.size()+'opwener Val>>>'+opowner);
usGeoLocn = [select name,TestGeoLocn__c from User where ID In : opOwner];
for(User usr:usGeoLocn){
    System.debug('Val============'+usr.Name);
    usrMap.put(usr.id,usr);
}
for(Opportunity opp : trigger.new) {
    system.debug('User='+usrMap.get(opp.OwnerId)+'\t loc='+usrMap.get(opp.OwnerId).TestGeoLocn__c);
  opp.GeoLocn__c=usrMap.get(opp.OwnerId).TestGeoLocn__c;
  opp.Amount=510;
}
//}
}
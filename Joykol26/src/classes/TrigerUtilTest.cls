@isTest
public class TrigerUtilTest {
    
    
    
   Date startDate = System.today();
   Date endDate = startDate.addYears(1);
   public static String generateRandomNumber(){
   	
    Decimal randomValue = 100000 * math.random();
    String geoCode = String.valueOf(randomValue);
    geoCode = geoCode.substring(0,5);
    return geoCode; 
}
    public Opportunity loadCommonData(){
          /*
    * Fetching the profile Id of System Administrator and Sales Associate 
    * Creating 2 Users 
    */
    list<User> lstUser= new List<User>();
    Opportunity newOpportunity;
  
    system.debug('$$$$$$$$$$$$$$$$$I\'m called');
    // FETCHING THE ID OF THE PROFILES
    
    List<Profile> profileList = [SELECT id , Name FROM profile WHERE name IN ('Standard Platform User','System Administrator')];
    Id standardUserProfileId , sysAdminProfileId;
    
    for(Profile iterator:profileList)
    {
        if(iterator.Name == 'Standard Platform User'){
            standardUserProfileId = iterator.Id;
        }
        else if( iterator.Name == 'System Administrator') {
            sysAdminProfileId = iterator.Id;
        }
      
    
    }
    
    // Getting role id of user role 'Non GSA' 
    UserRole userRole = [ SELECT Id, Name FROM UserRole WHERE Name='CEO'];
    ID userRoleId = userRole.Id;
    
      
   // System.debug('current user --> '+UserInfo.getUserId()+Userinfo.getFirstName());
    
    User insertUser = [SELECT Id,TestGeoLocn__c FROM User WHERE ProfileId = : sysAdminProfileId AND IsActive = true AND Id <> :UserInfo.getUserId() LIMIT 1];
    User  testDataUser;
    if(insertUser <> null)
    {
      System.runAs(insertUser)
      {
           // System.debug('current user --> '+UserInfo.getUserId());
            /********************************************** CREATING USERS ************************************************************/ 
		 List<Account> lstAcct = new  List<Account>();
         Account newAccount;
        
         newAccount = new Account(Name='Test Account 1'+generateRandomNumber() );
     
         lstAcct.add( newAccount );
         
         insert lstAcct;
         
    	  newOpportunity = new Opportunity(Name='Saikat', AccountId=lstAcct.get(0).id,CloseDate=endDate,Amount=420,StageName='Prospecting');
         insert newOpportunity;
         Opportunity oppTest = [SELECT Id, GeoLocn__c FROM Opportunity WHERE Id =: newOpportunity.Id];
         system.debug('**GeoLocn__c**'+oppTest.GeoLocn__c);
             
                /*testDataUser = new User(alias = 'Max', email='Max@abc.com',
                      emailencodingkey='UTF-8', lastname='payne', languagelocalekey='en_US',
                      localesidkey='en_US', profileid = sysAdminProfileId ,
                      timezonesidkey='America/Los_Angeles', TestGeoLocn__c='Dilli',username='maxp'+generateRandomNumber()+'@ihg.com' , isActive=true);
                
                lstUser.add( testDataUser );
                
                // Insert users                           
                insert lstUser;*/ 
                
      }
    }
  
  return newOpportunity;
  
    }

}
@isTest
public class OppurtunityUtilTest {
    
    
    
   Date startDate = System.today();
   Date endDate = startDate.addYears(1);
public static String generateRandomNumber(){
    Decimal randomValue = 100000 * math.random();
    String geoCode = String.valueOf(randomValue);
    geoCode = geoCode.substring(0,5);
    return geoCode; 
}
    public void loadCommonData(){
          /*
    * Fetching the profile Id of System Administrator and Sales Associate 
    * Creating 2 Users 
    */
    list<User> lstUser= new List<User>();
  
    
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
    
      
    System.debug('current user --> '+UserInfo.getUserId()+Userinfo.getFirstName());
    
    User insertUser = [SELECT Id FROM User WHERE ProfileId = : sysAdminProfileId AND IsActive = true AND Id <> :UserInfo.getUserId() LIMIT 1];
    User  testDataUser;
    if(insertUser <> null)
    {
      System.runAs(insertUser)
      {
            System.debug('current user --> '+UserInfo.getUserId());
            /********************************************** CREATING USERS ************************************************************/ 
    
                
                testDataUser = new User(alias = 'Max', email='Max@abc.com',
                      emailencodingkey='UTF-8', lastname='payne', languagelocalekey='en_US',
                      localesidkey='en_US', profileid = sysAdminProfileId ,
                      timezonesidkey='America/Los_Angeles', username='maxp'+generateRandomNumber()+'@ihg.com' , isActive=true);
                
                lstUser.add( testDataUser );
                
                // Insert users                           
                insert lstUser; 
      }
    }
  System.runAs( testDataUser ) {
    // CREATING ACCOUNTS
      
        List<Account> lstAcct = new  List<Account>();
         Account newAccount;
        
         newAccount = new Account(Name='Test Account 1'+generateRandomNumber() );
     
         lstAcct.add( newAccount );
         
         insert lstAcct;
    // CREATING ACCOUNTS 
    
   List<Opportunity>  lstOpp = new  List<Opportunity>();
     Opportunity newOpportunity;
     
     newOpportunity = new Opportunity(Name='Saikat', AccountId=lstAcct.get(0).id,CloseDate=endDate,Amount=420,StageName='Prospecting');
    
         lstOpp.add( newOpportunity );
          insert lstOpp;
        System.assertEquals(newOpportunity.Amount,420); 
        
        newOpportunity.Amount = 555;
        update newOpportunity;
        System.assertEquals(newOpportunity.Amount,555);
        
       
        OpportunityRetrievalClass1 oppretrieve = new OpportunityRetrievalClass1();
        oppretrieve.SaveInline();
        
  }
    }

}
public class LoginPages {

    // Variables to create a new user
    public UserRegistration__c username { get; set; }
    public String firsttimePassword { get; set; }
     public String authPassword { get; set; }
    public String male { get; set; }
    public String female { get; set; }
    public String phone { get; set; }
    public String email { get; set; }
    public String fname { get; set; }
    public String gender;
    public String usrName;
    // Variables to change password
    public String newPassword { get; set; }
    public String confPassword{get;set;}
    public String pswdChangeEmail{get;set;}
    public String oldPswd{get;set;}
    // Variables to store country and state selected by user
    public String state { get; set; }    
    public String country{get;set;}  
    List<UserRegistration__c> profileDtail{get;set;}
    public UserRegistration__c profile{get;set;}
    
public LoginPages(ApexPages.StandardController controller) { 
   username = (UserRegistration__c)controller.getRecord();
   String profile_Id = ApexPages.currentPage().getParameters().get('id');
   if(profile_ID!=null){
   profile=[SELECT Email__c,First_Name__c FROM UserRegistration__c WHERE id =: profile_Id ];
   System.debug('Email__c##############'+profile.Email__c);
   }
    }
    
public PageReference registerUser() {
              
        PageReference pageRef = ApexPages.CurrentPage();    
        //System.debug('state>>>>'+state+'country#####'+country);      
        email=username.Email__c ;
        male=username.Gender__c;
        female=username.Gender__c;
        phone=username.Phone__c;
        fname=username.First_Name__c;
        username.Name=email;
        usrName=username.Name;
        
                
        /****===============First Time Password Encryption======================*****/
        Blob cryptoKey = Crypto.generateAesKey(128);
        // Generate the data to be encrypted.
        Blob data = Blob.valueOf(email);        
        // Encrypt the data and have Salesforce.com generate the initialization vector
        Blob encryptedData = Crypto.encryptWithManagedIV('AES128', cryptoKey, data);
        String ecData=EncodingUtil.base64Encode(encryptedData);
        String ftPswd=ecData.substring(0, 8);
        /*system.debug('encryptedData>>>>>>>>>>>>>>>>>>>>>>>>>'+ecData+'\t'+ftPswd);       
        // Decrypt the data - the first 16 bytes contain the initialization vector
        Blob decryptedData = Crypto.decryptWithManagedIV('AES128', cryptoKey, encryptedData);
        // Decode the decrypted data for subsequent use
        String decryptedDataString = decryptedData.toString();
        system.debug('decryptedDataString=================='+decryptedData.toString());*/
       /****===============First Time Password Encryption Completes======================*****/
        if(male.equals('Male'))
          gender=male;
         else
          gender=female; 
        UserRegistration__c usrReg = new UserRegistration__c(Email__c=email,Name=usrName,First_Name__c=fname,Phone__c=phone,Gender__c=gender,SendEmail__c=true,FirstTimePassword__c=ftPswd,UserPassword__c=ftPswd);
        try{
        insert usrReg; 
        PageReference page = System.Page.SiteRegisterConfirm;
        page.setRedirect(true);
        return page; 
        }
        catch (System.DmlException e) {
       // System.debug(e.getMessage()); 
       // String msg=e.getMessage();
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Duplicate Email found');
        ApexPages.addMessage(myMsg);
       /* ApexPages.addMessage(e.getMessage());
        PageReference page = System.Page.Exception;
        page.setRedirect(true);
        return page;*/
         }
      
        return null;
    }

     /****===============Duplicate Email Check While User Input======================*****/
     public PageReference checkEmail(){  
         System.debug('inside check email');
         PageReference pageRef = ApexPages.CurrentPage();
         String emailId = username.Email__c;
         System.debug('emailId=============='+emailId);
         List<UserRegistration__c> candidateEmailList =new List<UserRegistration__c>();
         candidateEmailList=[select Email__c from UserRegistration__c where Email__c =: emailId ];
         System.debug('&&&&&&' +candidateEmailList.size() );
         if(candidateEmailList.size()>0){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Duplicate Email found');
            ApexPages.addMessage(myMsg);
        }
         
        return pageRef;
    }

     /****===============Validation Whether The User Is Logging For The First Time======================*****/
    public PageReference validateUser() {
        
        PageReference pageRef = ApexPages.CurrentPage();
        List<UserRegistration__c> usrVal =new List<UserRegistration__c>();
        email=username.Email__c ;
        firsttimePassword=username.FirstTimePassword__c;
        //system.debug('Val Log In======='+email + '\t'+ 'Val 1st Pswd=======' + firsttimePassword);
        usrVal=[select FirstTimePassword__c,UserPassword__c,Email__c from UserRegistration__c where Email__c =: email];
        //system.debug('firsttimePassword..............' + usrVal.get(0).FirstTimePassword__c);
        String userEmail=usrVal.get(0).Email__c;
        String defpswd=usrVal.get(0).FirstTimePassword__c;
        String pswd=usrVal.get(0).UserPassword__c;
        if(pswd.equals(defpswd)){
           // system.debug('*************************1st Time User****************');
            PageReference pageRefred = new PageReference('/apex/ChangePswd?id='+usrVal.get(0).id);
            pageRefred.setRedirect(true);
            return pageRefred;
        }
        else if(firsttimePassword.equals(pswd)&&email.equalsIgnoreCase(userEmail)) {
           // system.debug('*************************NOT 1st Time User****************');
            PageReference pageProfile = new PageReference('/apex/Profile?id='+usrVal.get(0).id);
            pageProfile.setRedirect(true);
            return pageProfile;
        }
        else{
            // System.debug('Passwords dont match');
             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Passwords dont match');
             ApexPages.addMessage(myMsg);
        }
        return null;
    }
    /****===============Change Password Directly From Page======================*****/
    public PageReference passwordChange() {     
    
     PageReference pageRef = ApexPages.CurrentPage();
     List<UserRegistration__c> usrPswd =new List<UserRegistration__c>();
     usrPswd=[select Email__c,UserPassword__c from UserRegistration__c where Email__c =: pswdChangeEmail];   
     //System.debug('pswdChangeEmail======='+pswdChangeEmail+'oldPswd======'+oldPswd+'/t'+'usrPswd.get(0).UserPassword__c========='+usrPswd.get(0).UserPassword__c+'/t'+'newPassword'+newPassword+'confPassword======='+confPassword);
     if(usrPswd.size()>0){
     String dbEmail=usrPswd.get(0).Email__c;
    
     if(usrPswd.get(0).UserPassword__c.equals(oldPswd)){
        if(newPassword.equals(confPassword)){
       // System.debug('Passwords R Equals========');
        usrPswd.get(0).UserPassword__c=confPassword;
        update usrPswd;
        PageReference pageProfile = new PageReference('/apex/ThankYouPasswordChange');
        pageProfile.setRedirect(true);
        return pageProfile;
       // System.debug('===========Password change successfull=================');
     }
      else{
        //System.debug('Passwords dont match');
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Passwords dont match');
        ApexPages.addMessage(myMsg);
     }
     }
     else{
       // System.debug('Passwords dont match');
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Passwords dont match');
        ApexPages.addMessage(myMsg);
     }
     }
      else{
       // System.debug('Email Doesnt Exist');
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Email Doesnt Exist');
        ApexPages.addMessage(myMsg);
     }
    return null;    
        
    }
    /****===============For First Time Password Change======================*****/
    public PageReference passwordConfirmation(){
    
     PageReference pageRef = ApexPages.CurrentPage();
     List<UserRegistration__c> usrPswd =new List<UserRegistration__c>();
    // List<UserRegistration__c> usrUpdtPswd =new List<UserRegistration__c>();
     String user_Id = ApexPages.currentPage().getParameters().get('id');
     usrPswd=[select Email__c,UserPassword__c from UserRegistration__c where id =: user_Id];
     //System.debug('new p========'+newPassword+'/t'+'conf p========'+confPassword);
     if(newPassword.equals(confPassword)){
       //System.debug('Passwords R Equals========');
        usrPswd.get(0).UserPassword__c=confPassword;
        update usrPswd;
        //System.debug('===========Password change successfull=================');
     }
     else{
        //System.debug('Passwords dont match');
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Passwords dont match');
        ApexPages.addMessage(myMsg);
     }
    return null;
    }
    
    /****===Generates country dropdown from country settings=====*****/
    public List<SelectOption> getCountriesSelectList() {
        PageReference pageRef = ApexPages.CurrentPage();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', '-- Select One --'));        
        // Find all the countries in the custom setting
        Map<String, Foundation_Countries__c> countries = Foundation_Countries__c.getAll();
        
        // Sort them by name
        List<String> countryNames = new List<String>();
        countryNames.addAll(countries.keySet());
        countryNames.sort();
        
        // Create the Select Options.
        for (String countryName : countryNames) {
            Foundation_Countries__c country = countries.get(countryName);
            options.add(new SelectOption(country.country_code__c, country.Name));
        }
        return options;
    }
    
    /****===To generate the states picklist based on the country selected by user.=====*****/
    public List<SelectOption> getStatesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        // Find all the states we have in custom settings.
        Map<String, Foundation_States__c> allstates = Foundation_States__c.getAll();
        
        // Filter states that belong to the selected country
        Map<String, Foundation_States__c> states = new Map<String, Foundation_States__c>();
        
        //String countryId = ApexPages.currentPage().getParameters().get('firstParam');
              
        for(Foundation_States__c state : allstates.values()) {
          if (state.country_code__c == this.country) {
            //if (state.country_code__c ==countryId) {
                states.put(state.name, state);
            }
         }
        
        // Sort the states based on their names
        List<String> stateNames = new List<String>();
        stateNames.addAll(states.keySet());
        stateNames.sort();
        
        // Generate the Select Options based on the final sorted list
        for (String stateName : stateNames) {
            Foundation_States__c state = states.get(stateName);
            options.add(new SelectOption(state.state_code__c, state.state_name__c));
        }
        system.debug('options size'+options.size());
         // If no states are found, just say not required in the dropdown.
        if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', 'Not Required'));
        }
        system.debug('stateNames.Name>>>>>>>>>>'+options);
        return options;
    }    
    
}
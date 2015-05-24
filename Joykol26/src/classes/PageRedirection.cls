public with sharing class PageRedirection {
        
        public PageReference reDirectRegistration() {   
     PageReference pageRef = new PageReference('/apex/LogInPage');
     return pageRef;       
    }
    public PageReference reDirectLogin() {   
     PageReference pageRef = new PageReference('/apex/UserAuth');
     return pageRef;       
    }
    public PageReference reDirectChangePswd() {   
     PageReference pageRef = new PageReference('/apex/ChangePssword');
     return pageRef;       
    }

}
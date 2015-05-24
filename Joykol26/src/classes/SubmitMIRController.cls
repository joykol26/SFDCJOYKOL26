public with sharing class SubmitMIRController{

public MIR__C mirObject;

public String addrRequestor{get;set;}
public String addrReferrer{get;set;}
public String externalId{get;set;}
public String lastNameRequestor{get;set;}
public String lastNameReferrer{get;set;}
public String product{get;set;}
public String username='ksjs196@astrazeneca.net.azusgb02.gmipdevcts';
public String pswd='march_15';

public SubmitMIRController(ApexPages.StandardController controller) {
		mirObject=(MIR__C)stdController.getRecord();
    }
    
public void doSubmitMir(){
	
partnerSoapSforceCom.Soap sp = new partnerSoapSforceCom.Soap();
partnerSoapSforceCom.LoginResult lr=sp.login(username, pswd);
System.debug('result==>'+lr);
system.debug('session....>'+lr.sessionId);
soapSforceComSchemasClassExternalme  customWSref= new soapSforceComSchemasClassExternalme();
soapSforceComSchemasClassExternalme.SessionHeader_element sessionInfo=new soapSforceComSchemasClassExternalme.SessionHeader_element();
sessionInfo.sessionId=lr.sessionId;

//Input parameter
//address formation
soapSforceComSchemasClassExternalme.Address addressref=new soapSforceComSchemasClassExternalme.Address();
addressref.addressId='';
soapSforceComSchemasClassExternalme.Person person= new soapSforceComSchemasClassExternalme.Person();
person.lastName = lastNameReferrer;
//person.firstname='Han';
person.personId='9999';
//person.recordType = '012F0000000yIZSIA2';
//person.recordType = '012F0000000Gd7WIAS';
person.recordType = 'Employee_MVN';

soapSforceComSchemasClassExternalme.MedicalInquiry MI=new soapSforceComSchemasClassExternalme.MedicalInquiry();
MI.deliveryMethod='email';
MI.inquiryAddress=addressref;
MI.productName=product;
MI.requester = person; 
//Stub
try{
soapSforceComSchemasClassExternalme.ExternalMedicalInquiriesMVN stub=new soapSforceComSchemasClassExternalme.ExternalMedicalInquiriesMVN();   
stub.SessionHeader=sessionInfo;      
soapSforceComSchemasClassExternalme.Result result=stub.createCasesForInquiries(MI);   
system.debug('result....>'+result.interactionId+' '+result.inquiryId);   
system.debug('result....>'+ result.message); 
}catch(Exception e){
 System.debug(e.getMessage());   
}  	
}
}
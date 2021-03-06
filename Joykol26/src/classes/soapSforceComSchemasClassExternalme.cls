//Generated by wsdl2apex

public class soapSforceComSchemasClassExternalme {
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class Result {
        public String inquiryId;
        public String interactionId;
        public String interactionNumber;
        public String message;
        public String status;
        private String[] inquiryId_type_info = new String[]{'inquiryId','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] interactionId_type_info = new String[]{'interactionId','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] interactionNumber_type_info = new String[]{'interactionNumber','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] message_type_info = new String[]{'message','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] status_type_info = new String[]{'status','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'inquiryId','interactionId','interactionNumber','message','status'};
    }
    public class AllowFieldTruncationHeader_element {
        public Boolean allowFieldTruncation;
        private String[] allowFieldTruncation_type_info = new String[]{'allowFieldTruncation','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'allowFieldTruncation'};
    }
    public class DebuggingHeader_element {
        public soapSforceComSchemasClassExternalme.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class Address {
        public String addressId;
        public String addressLine1;
        public String addressLine2;
        public String businessName;
        public String city;
        public String country;
        public String phone;
        public Boolean primary;
        public String state;
        public String zip;
        private String[] addressId_type_info = new String[]{'addressId','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] addressLine1_type_info = new String[]{'addressLine1','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] addressLine2_type_info = new String[]{'addressLine2','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] businessName_type_info = new String[]{'businessName','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] city_type_info = new String[]{'city','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] phone_type_info = new String[]{'phone','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] primary_type_info = new String[]{'primary','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] state_type_info = new String[]{'state','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] zip_type_info = new String[]{'zip','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'addressId','addressLine1','addressLine2','businessName','city','country','phone','primary','state','zip'};
    }
    public class createCasesForInquiries_element {
        public soapSforceComSchemasClassExternalme.MedicalInquiry medicalInquiry;
        private String[] medicalInquiry_type_info = new String[]{'medicalInquiry','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'medicalInquiry'};
    }
    public class createCasesForInquiriesResponse_element {
        public soapSforceComSchemasClassExternalme.Result result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class Person {
        public String country;
        public String credentials;
        public String email;
        public String fax;
        public String firstName;
        public String lastName;
        public String middleName;
        public String personId;
        public String phone1;
        public String phone2;
        public String recordType;
        public String salutation;
        public String specialty;
        public String title;
        public String type_x;
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] credentials_type_info = new String[]{'credentials','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] email_type_info = new String[]{'email','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] fax_type_info = new String[]{'fax','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] firstName_type_info = new String[]{'firstName','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] lastName_type_info = new String[]{'lastName','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] middleName_type_info = new String[]{'middleName','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] personId_type_info = new String[]{'personId','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] phone1_type_info = new String[]{'phone1','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] phone2_type_info = new String[]{'phone2','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] recordType_type_info = new String[]{'recordType','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] salutation_type_info = new String[]{'salutation','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] specialty_type_info = new String[]{'specialty','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] title_type_info = new String[]{'title','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'country','credentials','email','fax','firstName','lastName','middleName','personId','phone1','phone2','recordType','salutation','specialty','title','type_x'};
    }
    public class MedicalInquiry {
        public String deliveryMethod;
        public String email;
        public String fax;
        public soapSforceComSchemasClassExternalme.Address inquiryAddress;
        public String inquiryId;
        public String inquiryText;
        public String origin;
        public String originCountry;
        public String phone;
        public String productId;
        public String productName;
        public soapSforceComSchemasClassExternalme.Person referredBy;
        public soapSforceComSchemasClassExternalme.Address[] referredByAddresses;
        public soapSforceComSchemasClassExternalme.Person requester;
        public soapSforceComSchemasClassExternalme.Address[] requesterAddresses;
        private String[] deliveryMethod_type_info = new String[]{'deliveryMethod','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] email_type_info = new String[]{'email','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] fax_type_info = new String[]{'fax','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] inquiryAddress_type_info = new String[]{'inquiryAddress','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] inquiryId_type_info = new String[]{'inquiryId','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] inquiryText_type_info = new String[]{'inquiryText','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] origin_type_info = new String[]{'origin','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] originCountry_type_info = new String[]{'originCountry','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] phone_type_info = new String[]{'phone','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] productId_type_info = new String[]{'productId','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] productName_type_info = new String[]{'productName','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] referredBy_type_info = new String[]{'referredBy','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] referredByAddresses_type_info = new String[]{'referredByAddresses','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','-1','true'};
        private String[] requester_type_info = new String[]{'requester','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','1','true'};
        private String[] requesterAddresses_type_info = new String[]{'requesterAddresses','http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',null,'0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN','true','false'};
        private String[] field_order_type_info = new String[]{'deliveryMethod','email','fax','inquiryAddress','inquiryId','inquiryText','origin','originCountry','phone','productId','productName','referredBy','referredByAddresses','requester','requesterAddresses'};
    }
    public class ExternalMedicalInquiriesMVN {
        public String endpoint_x = 'https://cs7.salesforce.com/services/Soap/class/ExternalMedicalInquiriesMVN';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassExternalme.CallOptions_element CallOptions;
        public soapSforceComSchemasClassExternalme.SessionHeader_element SessionHeader;
        public soapSforceComSchemasClassExternalme.DebuggingInfo_element DebuggingInfo;
        public soapSforceComSchemasClassExternalme.DebuggingHeader_element DebuggingHeader;
        public soapSforceComSchemasClassExternalme.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN', 'soapSforceComSchemasClassExternalme'};
        public soapSforceComSchemasClassExternalme.Result createCasesForInquiries(soapSforceComSchemasClassExternalme.MedicalInquiry medicalInquiry) {
            soapSforceComSchemasClassExternalme.createCasesForInquiries_element request_x = new soapSforceComSchemasClassExternalme.createCasesForInquiries_element();
            request_x.medicalInquiry = medicalInquiry;
            soapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_element response_x;
            Map<String, soapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_element> response_map_x = new Map<String, soapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',
              'createCasesForInquiries',
              'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',
              'createCasesForInquiriesResponse',
              'soapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}
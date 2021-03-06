//Generated by wsdl2apex

public class AsyncSoapSforceComSchemasClassExternalme {
    public class createCasesForInquiriesResponse_elementFuture extends System.WebServiceCalloutFuture {
        public soapSforceComSchemasClassExternalme.Result getValue() {
            soapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_element response = (soapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncExternalMedicalInquiriesMVN {
        public String endpoint_x = 'https://cs7.salesforce.com/services/Soap/class/ExternalMedicalInquiriesMVN';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
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
        public AsyncSoapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_elementFuture beginCreateCasesForInquiries(System.Continuation continuation,soapSforceComSchemasClassExternalme.MedicalInquiry medicalInquiry) {
            soapSforceComSchemasClassExternalme.createCasesForInquiries_element request_x = new soapSforceComSchemasClassExternalme.createCasesForInquiries_element();
            request_x.medicalInquiry = medicalInquiry;
            return (AsyncSoapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',
              'createCasesForInquiries',
              'http://soap.sforce.com/schemas/class/ExternalMedicalInquiriesMVN',
              'createCasesForInquiriesResponse',
              'soapSforceComSchemasClassExternalme.createCasesForInquiriesResponse_element'}
            );
        }
    }
}
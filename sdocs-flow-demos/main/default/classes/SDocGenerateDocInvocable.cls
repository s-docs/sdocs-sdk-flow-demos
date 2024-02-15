global with sharing class SDocGenerateDocInvocable {
    

    @InvocableMethod(label='Generate Document using SDK' description='Generate Document using SDK')
    global static List<SDocFlowOutput> generateDocument(List<SDocFlowInput> generateDocInput) {
        SDocFlowInput theInputs = generateDocInput[0];
        String jsonResp = SDOC.DocumentSDK.generateDoc(theInputs.templateId,theInputs.objectId);
        System.debug('>>>>>>>>  jsonResp: '+jsonResp);
        Map<String,String> respAsObject = (Map<String,String>)JSON.deserialize(jsonResp, 
                                                        Map<String,String>.class);
        System.debug('>>>>>>>>  SDoc Id: '+respAsObject.get('id'));
        return new List<SDocFlowOutput>{new SDocFlowOutput(respAsObject.get('id'))};
    }

    global class SDocFlowInput {
        @InvocableVariable(label='Template Id' description='Template Id')
        global Id templateId;
        
        @InvocableVariable(label='Salesforce Record Id' description='Salesforce Record Id')
        global Id objectId;

        public SDocFlowInput(){

        }
        public SDocFlowInput(Id templateId, Id objectId) {
            this();
            this.templateId = templateId;
            this.objectId = objectId;
        }
    }
    global class SDocFlowOutput {
        @InvocableVariable(label='Generated SDoc Id' description='Generated SDoc Id')
        global Id sDocId;

        public SDocFlowOutput(){

        }
        public SDocFlowOutput(Id id) {
            this();
            this.sDocId = id;
        }
    }
}
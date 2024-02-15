global with sharing class IntializeDocumentInvocable {
    

    @InvocableMethod(label='Initialize Document for generation' description='Initialize Document for generation')
    global static List<SDocFlowOutput> generateDocument(List<SDocFlowInput> generateDocInput) {
        SDocFlowInput theInputs = generateDocInput[0];
        Map<String,String> inputMap = new Map<String,String>();
        for(FlowMapClass flowInput : theInputs.documentInputs){
            inputMap.put(flowInput.key,flowInput.value);
        }
        SDOC.DocumentOptions docOptions = new SDOC.DocumentOptions(inputMap);
        SDOC__SDoc__c theSDoc = SDOC.DocumentSDK.createSDoc(theInputs.templateId, theInputs.objectId,docOptions);
        
        List<SDocFlowOutput> flowOutput = new List<SDocFlowOutput>();
        flowOutput.add(new SDocFlowOutput(theSDoc.Id));
        return flowOutput; 
    }

    global class SDocFlowInput {
    
        @InvocableVariable(label='Template Id' description='Template Id')
        global Id templateId;
        
        @InvocableVariable(label='Salesforce Record Id' description='Salesforce Record Id')
        global Id objectId;


        @InvocableVariable(label='Document Inputs' description='Document Inputs')
        global FlowMapClass[] documentInputs;

        public SDocFlowInput(){

        }
        public SDocFlowInput(Id templateId, Id objectId, FlowMapClass[] inputs) {
            this();
            this.templateId = templateId;
            this.objectId = objectId;
            this.documentInputs = inputs;
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
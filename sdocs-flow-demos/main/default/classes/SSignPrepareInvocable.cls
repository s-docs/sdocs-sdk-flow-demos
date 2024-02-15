global with sharing class SSignPrepareInvocable {
    @InvocableMethod(label='Prepare Envelope' description='Prepares Envelope')
    global static List<Result> prepareEnvlope(List<Id> sdocIds) {
        return new List<Result>{new Result(SDOC.ESignSDK.prepareEnvelope(sdocIds))};
    }

    global class Result {
        @InvocableVariable(label='Generated Envelope Id' description='The generated Envelope Id')
        global Id EnvelopeId;

        Result(Id id) {
            this.EnvelopeId = id;
        }
    }
}
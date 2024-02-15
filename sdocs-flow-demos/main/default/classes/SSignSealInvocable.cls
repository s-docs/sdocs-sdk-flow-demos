global with sharing class SSignSealInvocable {
    @InvocableMethod(label='Seal Envelope' description='Seals Envelope')
    global static List<Result>sealEnvelopeAndGetSigningLink(List<Id> envelopeId) {
        return new List<Result>{new Result(SDOC.ESignSDK.sealEnvelopeAndGetSigningLink(envelopeId[0]))};
    }

    global class Result {
        @InvocableVariable(label='Signing Link' description='Signing Link')
        global String signingLink;

        Result(String signingLink) {
            this.signingLink = signingLink;
        }
    }
}
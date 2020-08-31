public class RestApexTrigger {
    public static void createApexTrigger(){
        String json = '{ "Name" : "Account", "TableEnumOrId" : "Account","Body" : "trigger AccountHAndler4 on Account (after insert) {  }" }'; 
        httpRequest req = new httpRequest();
        req.setHeader('Authorization','Bearer '+userInfo.getSessionId());
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v27.0/sobjects/ApexTrigger');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');
        req.setBody(json);
        Http httpReq = new Http();
        HttpResponse res = httpReq.send(req); 
        System.debug(res.getStatus());
        System.debug(res.getBody());
        
    }
}
global class CalloutMock {
global with sharing class UploadFileMock implements HTTPCalloutMock{
    global HTTPResponse respond(HTTPRequest req){
        HttpResponse res = new HTTPResponse();
        res.setHeader('Content-Type', 'application/JSON');
        res.setBody('Your body');
        res.setStatusCode(201);
        return res;
    }
}
}
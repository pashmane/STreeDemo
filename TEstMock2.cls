@isTest
public class TEstMock2 {
    @isTest 
    public static void testCallout() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Id accId = '0017F000025wv0w';
        String res = TestController.method1(accId);
    }
}
@isTest
public class RestApexTriggerTest {
    PUBLIC static testMethod void testSetAccountPrimaryMember() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        RestApexTrigger.createApexTrigger();
    }
}
@isTest
public class ContactTriggerHandlerTests {
     @isTest(SeeAllData=true)
    static void TestDatawithManager()
    {
	Contact objContact = new Contact();
    objContact.LastName = 'yuvi';
    objContact.Choose_Domain__c = 'Manager';
         System.debug('before contact'+objContact);
    insert objContact;
        System.debug('after contact'+objContact);
     
    }
}
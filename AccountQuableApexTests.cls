@isTest(SeeAllData=true)
public class AccountQuableApexTests {
   
   static testmethod void callQuable()
    {
    Test.startTest();
	ID jobID = System.enqueueJob(new AccountQuableApex());
    Test.stopTest();
        System.debug('JobId'+jobID);
    AsyncApexJob jobInfo = [SELECT Status,NumberOfErrors FROM AsyncApexJob WHERE Id=:jobID];
    System.debug('jobInfo..'+jobInfo);
    Account acct = [SELECT Name,Phone FROM Account WHERE Name='TestAccount1' LIMIT 1];
    System.debug('account info  '+acct);
       
    }
}
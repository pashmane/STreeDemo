@isTest(SeeAllData=true)
public class CampaignBatchApexTests {
    static testmethod void callBatchApex()
    {
		list<Campaign> lstCamp = CampaignDataFactory.getData(190);
        insert lstCamp;
		CampaignBatchApex objCampBatch = new CampaignBatchApex();
        Test.startTest();
   		ID batchprocessid = Database.executeBatch(objCampBatch);
        Test.stopTest();
        System.debug('id'+batchprocessid);
    }
}
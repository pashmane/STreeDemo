global class CampaignBatchApex2 implements Database.Batchable<sObject>{
global Database.QueryLocator start(Database.BatchableContext BC){
            Integer count = [SELECT COUNT() FROM CAMPAIGN];
    	System.debug('Count from Batch 2::'+count);
      return Database.getQueryLocator('SELECT Id,Name,ActualCost FROM Campaign');
   }

global void execute(Database.BatchableContext BC, List<Campaign> lstCamp)
{
     list<Campaign> lstLocalCamp = new List<Campaign>();
       for(Campaign itrcamp : lstCamp)
     {
         if(itrcamp.ActualCost!=100000)
         {
             //System.debug('inside execute batch2'+itrcamp);
			 itrcamp.Name='abcd';
             itrcamp.ActualCost=200000;
             lstLocalCamp.add(itrcamp);
             //System.debug('batch 2'+lstLocalCamp);
             
         }
         else
         {
              //lstLocalCamp.add(itrcamp);
         }
         
             
         
     }
    System.debug('inside batch 2 localcamp size'+lstLocalCamp.size());
    update lstLocalCamp;
    }

global void finish(Database.BatchableContext BC){
     AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
      TotalJobItems, CreatedBy.Email
      FROM AsyncApexJob WHERE Id =
      :BC.getJobId()];
   
    System.debug('async Apex Job'+a);
    
   }
}
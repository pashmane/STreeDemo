global class CampaignBatchApex implements Database.Batchable<sObject> , Database.Stateful {
public list<Campaign> lstCamp2 = new list<Campaign>();
global Database.QueryLocator start(Database.BatchableContext BC){
   
      return Database.getQueryLocator('SELECT Id,Name,ActualCost FROM Campaign');
   }

global void execute(Database.BatchableContext BC, List<Campaign> lstCamp)
{
     list<Campaign> lstLocalCamp = new List<Campaign>();
   
       for(Campaign itrcamp : lstCamp)
     {
         if(itrcamp.ActualCost==100000)
         {
             //System.debug('inside execute'+itrcamp);
             lstLocalCamp.add(itrcamp);
             
         }
         else
         {
              lstCamp2.add(itrcamp);
         }
         
     }
    System.debug('inside batch 1 locamcamp size'+lstLocalCamp.size());
    System.debug('inside batch 1 lstcamp2 size'+lstcamp2.size());
    update lstLocalCamp;
    }

global void finish(Database.BatchableContext BC){
     AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
      TotalJobItems, CreatedBy.Email
      FROM AsyncApexJob WHERE Id =
      :BC.getJobId()];
   
    System.debug('async Apex Job'+a);
   
    //CampaignBatchApex2 objCampBatch2 = new CampaignBatchApex2();
    //insert lstCamp2;
    //ID batchprocessid = Database.executeBatch(objCampBatch2);
   }
}
public class JobTriggerTestHelper {
public static void demoData(integer objcount)
	{
    
    Job__c [] arrjob = new Job__c [objcount];
    list<Job__c> lstobj = new list<Job__c>(); 
    for(integer index=0;index<objcount;index++)
	{
        arrjob[index] = new Job__c();
        arrjob[index].Name = 'PHP devoloper_33333'+index;
		arrjob[index].Name__c = 'PHP_3333'+index;
		arrjob[index].No_of_positions__c = 35;
		arrjob[index].Expires_on__c = Date.valueOf('2017-11-11');
        if(index > 0 && index <= 3)
        {
	        arrjob[index].RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Developer').getRecordTypeId();
        }
        if(index > 3 && index <= 6)
        {
	        arrjob[index].RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Manager').getRecordTypeId();
        }
        if(index > 6 && index < objcount)
        {
	        arrjob[index].RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId();
        }
            
        lstobj.add(arrjob[index]);
        
    	
	}
   // return 0;
}
}
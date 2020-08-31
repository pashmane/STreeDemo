@isTest
public class JobTriggerHandlerTests {
    //@isTest(SeeAllData=true)
	/*static void TestDatawoManager()
    {
       		List<Job__c> lstJobObj = new List<Job__c>();
	    	//JobTriggerTestHelper.demoData(10);
        	string expectedD;
        	string expectedM;
        	string expectedA;
        	string actual;
    	    Job__c jobObj = new Job__c();
			jobObj.Name = 'PHP devoloper_1';
			jobObj.Name__c = 'PHP_1';
			jobObj.No_of_positions__c = 3;
			jobObj.Expires_on__c = Date.valueOf('2017-11-11');
            jobObj.RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Manager').getRecordTypeId();
        	lstJobObj.add(jobObj);
        	
        	
        	Job__c jobObj1 = new Job__c();
			jobObj1.Name = 'PHP devoloper_2222';
			jobObj1.Name__c = 'PHP_2222';
			jobObj1.No_of_positions__c = 30;
			jobObj1.Expires_on__c = Date.valueOf('2017-11-11');
 			//jobObj1.Manager__c = '0037F00000DXAX7';       
        	jobObj1.RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Developer').getRecordTypeId();
	        lstJobObj.add(jobObj1);        	
	      
        	
        	Job__c jobObj2 = new Job__c();
			jobObj2.Name = 'PHP_3333';
			jobObj2.Name__c = 'PHP_3333';
			jobObj2.No_of_positions__c = 35;
        	//jobObj2.Manager__c = '0037F00000DXAX7';
			jobObj2.Expires_on__c = Date.valueOf('2017-11-11');
	        jobObj2.RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId();
            lstJobObj.add(jobObj2);
        	insert lstJobObj;
        	
        	Job__c objjobmanager = [SELECT Manager__c FROM Job__c WHERE Name = 'PHP devoloper_1'];
        	Job__c objjobdev = [SELECT Manager__c FROM Job__c WHERE Name = 'PHP devoloper_2222'];
        	Job__c objjobadmin = [SELECT Manager__c FROM Job__c WHERE Name = 'PHP_3333'];
        	
        	System.debug('Admin : '+objjobadmin.Manager__c);
        	System.debug('Developer : '+objjobdev.Manager__c);
        	System.debug('Manager : '+objjobmanager.Manager__c);
        	actual = null;
        	expectedA= objjobadmin.Manager__c;
        	expectedD=  objjobdev.Manager__c;
        	expectedM= objjobmanager.Manager__c;
   
        System.assertNotEquals(expectedA, actual);
        System.assertNotEquals(expectedD, actual);
        System.assertNotEquals(expectedM, actual);

   
        
            
 
	}*/
     @isTest(SeeAllData=true)
    static void TestDatawithManager()
    {
        	List<Job__c> lstobjJob = new List<Job__c>();
	    	
        	string expectedD;
        	string expectedM;
        	string expectedA;
        	string actualD;
        	string actualM;
        	string actualA;
      
        	Job__c objJobad = new Job__c();
			objJobad.Name = 'systemadmine';
			objJobad.Name__c = 'systemadmine';
			objJobad.No_of_positions__c = 34;
			objJobad.Expires_on__c = Date.valueOf('2027-09-12');
 			//objJobad.Manager__c = '0037F00000FC5QW';
        	actualA = objJobad.Manager__c;
        	System.debug('actualA : '+actualA);
        	objJobad.RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('QA').getRecordTypeId();
        System.debug('at end of tm');
       
       
       
        try {
            System.debug('inside ttry');
            insert objJobad;
            System.debug('after insert');
        	}
        catch (Exception e)
        {
            
            System.debug('in catch'+e);
        }
        	
        	 /*
        	lstobjJob.add(objJobad);	
      			       
        	Job__c objJobdev = new Job__c();
			objJobdev.Name = 'JAVA devoloper';
			objJobdev.Name__c = 'JAVfA';
			objJobdev.No_of_positions__c = 30;
			objJobdev.Expires_on__c = Date.valueOf('2017-10-11');
        	objJobdev.Manager__c = '0037F00000FCAPa';
        	actualD = objJobdev.Manager__c;
        	System.debug('actualD : '+actualD);
        	objJobdev.RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Developer').getRecordTypeId();
        	
       		lstobjJob.add(objJobdev);	
        	
        	Job__c objJobm = new Job__c();
			objJobm.Name = 'csharpdevoloper';
			objJobm.Name__c = 'csharp_2662';
			objJobm.No_of_positions__c = 39;
			objJobm.Expires_on__c = Date.valueOf('2047-11-21');
 			//objJobm.Manager__c = '0037F00000FCAPa';    
        	actualM = objJobm.Manager__c;
        	System.debug('actualM : '+actualM);
        	objJobm.RecordTypeId = Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Manager').getRecordTypeId();
        	lstobjJob.add(objJobm);
        	insert lstobjJob;
        	
        	Job__c objjobmanager = [SELECT Manager__c FROM Job__c WHERE Name = 'csharpdevoloper'];
        	Job__c objjobdeve = [SELECT Manager__c FROM Job__c WHERE Name = 'JAVA devoloper'];
        	Job__c objjobadmin = [SELECT Manager__c FROM Job__c WHERE Name = 'systemadmine'];
        	
        	System.debug('Admin_Manager : '+objjobadmin.Manager__c);
        	System.debug('Developer_Manager : '+objjobdeve.Manager__c);
        	System.debug('Manager_Manager : '+objjobmanager.Manager__c);
        	
        	expectedA= objjobadmin.Manager__c;
        	expectedD=  objjobdeve.Manager__c;
        	expectedM= objjobmanager.Manager__c;
        	System.assertNotEquals(expectedA, null);
        	System.assertEquals(expectedD, actualD);
        	System.assertNotEquals(expectedM, null);
       */
        
    }
    
}
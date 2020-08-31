public class JobTriggerHandler {
   	 public static void insertData(list<Job__c> TriggerNewList)
   	 {
		List<Job__c> lstObj = new list<Job__c>(); 
         map<string,string> mapObj = new map<string,string>();
        list<RecordType> lstRcrdType = [SELECT id,Name FROM RecordType WHERE  sObjectType = 'Job__c']; 
         
         for(RecordType itrRt : lstRcrdType) 
             {
                 mapObj.put(itrRt.Id, itrRt.Name);
             }
    	 for(Job__c itrJob : TriggerNewList)
  		 {                                                 
    	   Job__c objJob1 = new Job__c(id=itrJob.id,RecordTypeId=itrJob.RecordTypeId,Manager__c=itrJob.Manager__c);
             
             for(String domainname : mapObj.keySet())
             {
				if(objJob1.RecordTypeId == domainname)
                {
                    list<contact> lstcontact = new list<contact>();
                    String sample1 = mapObj.get(domainname);
                    lstcontact = [SELECT id,Name FROM contact WHERE Choose_Domain__c =:+sample1];
               		if((objJob1.Manager__c) ==null)	
                    	{
                    		if(lstcontact.size()==1)
               				{
                   				objJob1.Manager__c=lstcontact[0].id;
                   				//System.debug(' assgned manager is :  '+ objJob1.Manager__c);
                                //System.debug('list elements value : '+objJob1);
                   				lstObj.add(objJob1);
                                update lstObj;
                   			}
                        }
                	}
             }
       
         }
           
	}
   public static void checkRecordType(list<Job__c> lstJobList)
    {
        System.debug('inside');

			list<RecordType> lstRcrdType = [SELECT id,Name FROM RecordType WHERE  sObjectType = 'Job__c'];
              map<string,string> mapObj = new map<string,string>();
             for(RecordType itrrcrd : lstRcrdType)
             {
                 mapObj.put(itrrcrd.Id, itrrcrd.Name);
             }
        //AggregateResult[] groupedResults = [SELECT Choose_Domain__c, COUNT(Id) FROM Contact WHERE Choose_Domain__c <> null GROUP BY Choose_Domain__c];
		//map<string,integer> mapdomaincount = new map<string,integer>();
        //for (AggregateResult ar : groupedResults)  
		{
   	 		///System.debug('Choose_Domain__c' + ar.get('Choose_Domain__c'));
   	 		//System.debug('COUNT ' + ar.get('expr0'));
            //string domainname = (string)ar.get('Choose_Domain__c');
            //System.debug('domainname of mapcountdomain'+domainname);
            //integer count = (integer)ar.get('expr0');
            //System.debug('count  of mapcountdomain'+count);
           // mapdomaincount.put(domainname, count);
		}
        
        list<Job__c> lstobjjob = new list<Job__c>();
          /*for(Job__c itrJob : lstJobList)
          {
              string domainid =itrJob.RecordTypeId;
             if(mapObj.containsKey(domainid))
             {
                 string domainname =mapObj.get(itrJob.RecordTypeId);
                 //System.debug('domainname'+domainname);
                 //System.debug(''+mapdomaincount.get(domainname));
                 if(mapdomaincount.get(domainname) == 0 || mapdomaincount.get(domainname)== null)
                 {
                     //System.debug('mapdomaincount');
                      string pickvalue = domainname;
                      MetaDataServiceContact.updatePicklistField(pickvalue);
                      itrJob.addError('No Manager Available For This Record Type Please Add One'+domainname);
                 }
             }
              
          }*/
     
             for(Job__c itrJob : lstJobList)
             {
                  string domainid =itrJob.RecordTypeId;
                 for(string key : mapObj.keySet())
                 {
                     if(domainid==key)
                     {
                       integer countdomain = [SELECT Count() FROM Contact WHERE Choose_Domain__c =:+mapObj.get(key) ];
                         if(countdomain==0)
                         {
                             string pickvalue = mapObj.get(key);
                             MetaDataServiceContact.updatePicklistField(pickvalue);
                             itrJob.addError('No Manager Available For This Record Type Please Add One'+mapObj.get(key));
                         }
                     }
                 }
             }
    	} 
}


             /*
             for(integer index = 0 ; index < lstContactDomain.size() ; index++)
             {
                 if(lstContactDomain[index].Choose_Domain__c == domainname)
                 {
                    //domainname = lstRcrdType[index].Name; 
                 	integer countdomain = [SELECT Count() From Contact where Choose_Domain__c =:+domainname ];
             		if(countdomain<0)
                    {
                	 itrJob.addError('No Manager Assigned For this record type');
                    }
                    else
                 	{
                     System.debug('assigned manager');
                 	}

                 }
             }
             */
             
             
            /*
             for(integer index=0;index<lstContactDomain.size();index++)
             {
                 System.debug('matched or not'+domainname.equals(lstRcrdType[index].ID));
                 if(domainname.equals(lstRcrdType[index].ID))
                 {
             		        
					domainname = lstRcrdType[index].Name; 
                 	integer countdomain = [SELECT Count() From Contact where Choose_Domain__c =:+domainname ];
             		if(countdomain<0)
                    {
                	 itrJob.addError('No Manager Assigned For this record type');
                    }
                    else
                 	{
                     System.debug('assigned manager');
                 	}
                 }
                 
         	 }*/
       
        /*
        oolean flag=false;
       List<Job__c> lstObj = new list<Job__c>(); 
       map<string,string> mapObj = new map<string,string>();
       list<RecordType> lstRcrdType = [SELECT id,Name from RecordType];
        for(RecordType itrRt : lstRcrdType) 
             {
                 mapObj.put(itrRt.Name, itrRt.Id);
             }
       
    	 for(Job__c itrJob : TriggerNewList)
  		 	 {                                                 
    	   		list<contact> lstDomain = [select Choose_Domain__c from contact];
                  System.debug('map elements '+mapObj);
                 System.debug('size of list'+lstDomain);
                 
                 System.debug('size of map'+mapObj.size());
                 for(contact cot : lstDomain)
                 {
                     System.debug('inside foreachloop cot.id is '+cot.Id);
                     if(mapObj.containsKey(cot.Id))
                     {
                         System.debug('map cointains key');
                         System.debug('print value'+cot.Id);
                     }
                 }
               
    		}*/
        

    
    
    
 /*
 //developer
             if(objJob1.RecordTypeId==Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Developer').getRecordTypeId())
       			{
          			/* 
          			 if(objJob1.Manager__c==null)
           			{
               			objJob1.Manager__c='0037F00000DXAX7';  
                        lstObj.add(objJob1);
           			}
					
               list<contact> lstcontact = new list<contact>();
               lstcontact = [select id from contact where Choose_Domain__c = 'Developer'];
               if(lstcontact.size()==1)
               {
                   objJob1.Manager__c=lstcontact[0].id;
                   System.debug('developer manager is :  '+ objJob1.Manager__c);
                   lstObj.add(objJob1);
               }
               else
               {
                   objJob1.addError('no Developer present');
               }
      			 }
       //Manager
       
       if(objJob1.RecordTypeId==Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Manager').getRecordTypeId())
       {
           /*
            if(objJob1.Manager__c==null)
        	   {  
            	   objJob1.Manager__c='0037F00000DXAk1';
                   lstObj.add(objJob1);
               }
           
           list<contact> lstcontact = new list<contact>();
               lstcontact = [select id from contact where Choose_Domain__c = 'Manager'];
               if(lstcontact.size()==1)
               {
                   objJob1.Manager__c=lstcontact[0].id;
                   System.debug('Manager manager is :  '+ objJob1.Manager__c);
                   lstObj.add(objJob1);
               }
               else
               {
                   objJob1.addError('no manager present');
               }
       }
       //Admin
       
       if(objJob1.RecordTypeId==Schema.SObjectType.Job__c.getRecordTypeInfosByName().get('Admin').getRecordTypeId())
       {  
          /* if(objJob1.Manager__c==null)
   		        {
				 objJob1.Manager__c='0037F00000DXFFF';  
                   lstObj.add(objJob1);
              	}
			
           list<contact> lstcontact = new list<contact>();
               lstcontact = [select id from contact where Choose_Domain__c = 'Admin'];
               if(lstcontact.size()==1)
               {
                   objJob1.Manager__c=lstcontact[0].id;
                   System.debug('Admin manager is :  '+ objJob1.Manager__c);
                   lstObj.add(objJob1);
               }
              else
               {
                   objJob1.addError('no Admin present');
               } 
       }
    
	   }*/



 /* list<contact> lstcontact = new list<contact>();
               lstcontact = [select id from contact where Choose_Domain__c = 'Developer'];
               if(lstcontact.size()==1)
               {
                   objJob1.Manager__c='lstcontact[0]';
               }
               else
               {
                   objJob1.addError('no Developer present');
               }*/  


  /* 
               list<contact> lstcontact = new list<contact>();
               lstcontact = [select id from contact where Choose_Domain__c = 'Manager'];
               if(lstcontact.size()==1)
               {
                   objJob1.Manager__c='lstcontact[0]';
               }
               else
               {
                   objJob1.addError('no manager present');
               } */


 /*list<contact> lstcontact = new list<contact>();
               lstcontact = [select id from contact where Choose_Domain__c = 'Admin'];
               if(lstcontact.size()==1)
               {
                   objJob1.Manager__c='lstcontact[0]';
               }
              else
               {
                   objJob1.addError('no Admin present');
               } */
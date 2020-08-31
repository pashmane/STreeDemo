public with sharing class DemoClass {
    public static string ControllerValue;
     public static List<DynamicFormControllerHandler> lstWrapper = new List<DynamicFormControllerHandler>() ;
    
    public sObject objDynamic;
     public static map<String,object> mapData = new map<String,object>() ;
   public String headings ;
     public void setdynamicobj()
    {
         objDynamic = Schema.getGlobalDescribe().get('Account').newSObject() ;
    }
    @AuraEnabled
public static string getData(String objname)
{
    list<String> lstLabelData = new list<String>();
    string allstirng;
    System.debug('getdata');
    PageReference secId = Page.SessionId;
    String aaa = secId.getContent().toString();
    String StartId = 'startingvalue';
    String StopId = 'endvalue';
    Integer result1 = aaa.indexOf(StartId)+StartId.length(); 
    Integer result2 = aaa.indexOf(StopId);
    String actualId = aaa.substring(result1,result2);
     	{
            
     		String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm(); 
            string objVal1= 'Account';
			String restAPIURL = sfdcURL + '/services/data/v29.0/sobjects/'+objname+'/describe/layouts';  
  			integer count = 0;
			HttpRequest httpRequest = new HttpRequest();  
			httpRequest.setMethod('GET');   
			httpRequest.setHeader('Authorization', 'OAuth ' + actualId);        
			httpRequest.setHeader('Authorization', 'Bearer ' + actualId); 
			string response = '';
			
			httpRequest.setEndpoint(restAPIURL);  
			try {  
		 		Http http = new Http();   
		 		HttpResponse httpResponse = http.send(httpRequest);  
		 		if (httpResponse.getStatusCode() == 200 ) 
                {  
                    Map<String, Object> maplayoutcomponent = new Map<String, Object>();
            list<object> lstLayout = new list<object>();
		 			mapData = (map<String,object>)JSON.deserializeUntyped(httpResponse.getBody());
             		lstLayout = (List<Object>)mapData.get('layouts');
					maplayoutcomponent = (Map<String, Object>)lstLayout[0];
              		list<object> lstlayoutsections = (List<Object>)maplayoutcomponent.get('editLayoutSections');
             		for(integer index=0;index<lstlayoutsections.size();index++)
             		{
                 		DynamicFormControllerHandler lstDynamicdata = new DynamicFormControllerHandler();
		                List<LabelField> lstdataLabelField = new  List<LabelField>() ; 
                
        		        map<String,Object> mapeditlayoutsection = (Map<String, Object>)lstlayoutsections[index];
                		String headings = (String) mapeditlayoutsection.get('heading');
		                lstDynamicdata.Heading = headings;
        		        list<object> lstlayoutrows = (List<Object>)mapeditlayoutsection.get('layoutRows');
               			for(integer index2=0;index2<lstlayoutrows.size();index2++)
               			{
                   
                    		map<String,Object> maplayoutitems = (Map<String, Object>)lstlayoutrows[index2];
                   			list<object> lstlayoutitems = (List<Object>)maplayoutitems.get('layoutItems');
                   			for(integer index3=0;index3<lstlayoutitems.size();index3++)
                   			{
                        		LabelField objLabelField = new LabelField();
                       			map<String,Object> maplayoutlabel = (Map<String, Object>)lstlayoutitems[index3];
                       			String labels = (String)maplayoutlabel.get('label');
                       			//System.debug('labels...'+labels);
                       			if(labels!='')
			                       {
            			           }
                       
                       			Boolean required = (Boolean)maplayoutlabel.get('required');
                       			list<object> lstlayoutcomponents ;
                       			if(labels=='')
                       				{
                            		}
                       			else
                       				{
                           				lstlayoutcomponents = (List<Object>)maplayoutlabel.get('layoutComponents');
                           				objLabelField.lstRequired = required;
                            			objLabelField.lstLabels = labels;
                           
			                           string lblvalue = objLabelField.lstLabels;
            			               lstLabelData.add(lblvalue);
                        			   //System.debug('lblvalue...'+lblvalue);
                          			   // System.debug('lstLabelData...'+lstLabelData);
                          			   //System.debug(' objLabelField.lstLabels..'+ objLabelField.lstLabels);
                       				   map<String,Object> mapdetails;
                       				for(integer index4=0;index4<lstlayoutcomponents.size();index4++)
                       				{
                       		 			mapdetails = (map<String,Object>)lstlayoutcomponents[0];
					   				}
                           			String value = (String)mapdetails.get('value');
                           			//lstLabelData.add(value);
                           			//System.debug('value...'+value);
                           			objLabelField.lstValue = value;
                           			lstdataLabelField.add(objLabelField);
                     				}
                        
                   			}
                 
	               }
                 
    				             lstDynamicdata.lstLabelField = lstdataLabelField;
                				 lstWrapper.add(lstDynamicdata);
								//return lstLabelData;            
                 				//System.debug('lstWrapper...'+lstWrapper.size());
             		}	
             
		 	} else {  
							   System.debug(' httpResponse ' + httpResponse.getBody() );  
			   				throw new CalloutException( httpResponse.getBody() );  
		 			}   
				} 
            catch( System.Exception e) 
            { 
                 System.debug('ERROR: '+ e);  
		 		throw e;  
			}  
   
	   	}
    
				for(String s: lstLabelData)
                {
        				allstirng +=',';
    					allstirng += s;
				}
    
    
				System.debug('lstLabelData...'+allstirng);
				return allstirng;   
	}

     @AuraEnabled
    public static list<sObject> getFieldData(list<string> data,string objname,string count)
    {
        System.debug('inside getField'+count);
        //string allstring = ;
    if(count==null)
    {
        count = '5';
    }
        string allstring='';
        string actualdata ='';
      for(integer index=0;index<data.size();)
      {
       // System.debug('data in getfield...'+data[index]);
          allstring += data[index];
          index++;
          if(index<data.size())
          {
               allstring += ' , ';
          }
         
      }
       // System.debug('SELECT '+allstring+' FROM '+objname+' LIMIT '+count+' ');
       
        list<sObject> lstdata = Database.query('SELECT '+allstring+' FROM '+objname+' LIMIT '+count+' '); 
        
       //System.debug('lstdata in getfield..'+lstdata);
		return lstdata;
    }
     @AuraEnabled
    public static list<sObject> getFieldDataWithSearch(list<string> data,string objname,string keyval)
    {
        System.debug('inside getField keyval'+keyval);
        //string allstring = ;
		string quote='';
        string allstring='';
        string actualdata ='';
      for(integer index=0;index<data.size();)
      {
       // System.debug('data in getfield...'+data[index]);
          allstring += data[index];
          index++;
          if(index<data.size())
          {
               allstring += ' , ';
          }
         
      }
       System.debug('SELECT '+allstring+' FROM '+objname+' where email LIKE \''+keyval+'%\'');
       
        list<sObject> lstdata = Database.query('SELECT '+allstring+' FROM '+objname+' where email LIKE \''+keyval+'%\''); 
       // select company,email from lead where email LIKE 'm%'
       //System.debug('lstdata in getfield..'+lstdata);
		return lstdata;
    }
@AuraEnabled
public static String getDisplay(String objname,string data)
{
    System.debug('Fields Query'+data);
    string allstirng;
    list<String> lstAcc = new list<String>();
    lstAcc.add(data);
    for(String s: lstAcc){
        allstirng +=',';
    	allstirng += s;
		}
	System.debug('Result of Fields...'+allstirng);
	return allstirng;  
}
   
     @AuraEnabled
    public static string getobjName()
    {
        string allstr ; 
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        for(string s : gd.keySet())
        {
           allstr+= ',';
            allstr+= s;
        }
        System.debug('allstr...values'+allstr);
        return allstr;
    }
     public class LabelField{
        
        public String lstLabels{set ; get ;}
   		 public String lstValue{set ; get ;}
        public Boolean lstRequired{set ; get ;}
        
    }
 
    public class DynamicFormControllerHandler {
    
        public  String Heading{set ; get ;}
        public List<LabelField> lstLabelField {set ;get ;}
   
    
    public DynamicFormControllerHandler()
    {
        
    }
   
  }

}
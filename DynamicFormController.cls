public class DynamicFormController {
    List<DynamicFormControllerHandler> lstWrapper;
    public sObject objDynamic;
    public boolean flag=true;
    public void setlstWrapper(list<DynamicFormControllerHandler> head)
    {
        this.lstWrapper = head;
    }
    public List<DynamicFormControllerHandler> getlstWrapper()
    {
        return lstWrapper;
    }
    public DynamicFormController()
    {
        lstWrapper = new List<DynamicFormControllerHandler>();
    }
    public String ControllerValue;
    
    public void  setControllerValue(String objname)
    {
        ControllerValue=objname;
        if(ControllerValue!=null)
        {
        	if(flag)
        	{
            	flag=false;
        		getdisplay();
        	}
        }
    }
    public String getControllerValue()
    {
        return ControllerValue;
    }
    
    public void setobjDynamic(String name)
    {
        
    }
    public sObject getobjDynamic()
        {
           return objDynamic;
        }
    public void setdynamicobj()
    {
         objDynamic = Schema.getGlobalDescribe().get(this.ControllerValue).newSObject() ;
    }
    map<String,object> mapData = new map<String,object>() ;
   public String headings ;
    public void setheadings(String head)
    {
       
        headings=head;
      
    }
    public String getheadings()
    {
        
        return headings;
         
    }
     public PageReference save()
    {
       try {
           System.debug('inside try');
           insert objDynamic;
       } 
        catch(System.DmlException e)
        {
            System.debug('not inserted');
            return null;
        }
        System.debug('objDynamic..'+objDynamic.ID);
        return null;
    }  

   public void getdisplay()
   		{
            setdynamicobj();
     	String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm(); 

String restAPIURL = sfdcURL + '/services/data/v29.0/sobjects/'+ControllerValue+'/describe/layouts';  
  integer count = 0;
HttpRequest httpRequest = new HttpRequest();  
httpRequest.setMethod('GET');   
httpRequest.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());        
httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID()); 
string response = '';

httpRequest.setEndpoint(restAPIURL);  
try {  
		 Http http = new Http();   
		 HttpResponse httpResponse = http.send(httpRequest);  
		 if (httpResponse.getStatusCode() == 200 ) {  
		 mapData = (map<String,object>)JSON.deserializeUntyped(httpResponse.getBody());
             list<object> lstLayout = (List<Object>)mapData.get('layouts');
			Map<String, Object> maplayoutcomponent = (Map<String, Object>)lstLayout[0];
              list<object> lstlayoutsections = (List<Object>)maplayoutcomponent.get('editLayoutSections');
             for(integer index=0;index<lstlayoutsections.size();index++)
             {
                 DynamicFormControllerHandler lstDynamicdata = new DynamicFormControllerHandler();
                 List<LabelField> lstdataLabelField = new  List<LabelField>() ; 
                
                 map<String,Object> mapeditlayoutsection = (Map<String, Object>)lstlayoutsections[index];
                 String headings = (String) mapeditlayoutsection.get('heading');
                // System.debug('headings..'+headings);
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
                          // System.debug(' objLabelField.lstLabels..'+ objLabelField.lstLabels);
                       map<String,Object> mapdetails;
                       for(integer index4=0;index4<lstlayoutcomponents.size();index4++)
                       		{
                       		 mapdetails = (map<String,Object>)lstlayoutcomponents[0];
					   		}
                           String value = (String)mapdetails.get('value');
                           objLabelField.lstValue = value;
                           lstdataLabelField.add(objLabelField);
                     }
                        
                   }
                 
               }
                 
                 lstDynamicdata.lstLabelField = lstdataLabelField;
                 lstWrapper.add(lstDynamicdata);
                 //System.debug('lstWrapper...'+lstWrapper.size());
             }
             
		 } else {  
			   System.debug(' httpResponse ' + httpResponse.getBody() );  
			   throw new CalloutException( httpResponse.getBody() );  
		 }   
} catch( System.Exception e) {  
		 System.debug('ERROR: '+ e);  
		 throw e;  
}  
   
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
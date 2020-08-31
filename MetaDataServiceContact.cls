global class MetaDataServiceContact {
    public class MetadataServiceExamplesException extends Exception { }
    public static void handleSaveResults(MetadataService.SaveResult saveResult)
{
    // Nothing to see?
    if(saveResult==null || saveResult.success)
    {
        System.debug('hello');
        return;
    }
    // Construct error message and throw an exception
    if(saveResult.errors!=null)
    {
        List<String> messages = new List<String>();
        messages.add(
            (saveResult.errors.size()==1 ? 'Error ' : 'Errors ') +
                'occured processing component ' + saveResult.fullName + '.');
        for(MetadataService.Error error : saveResult.errors)
            messages.add(
                error.message + ' (' + error.statusCode + ').' +
                ( error.fields!=null && error.fields.size()>0 ?
                    ' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
        if(messages.size()>0)
            throw new MetadataServiceExamplesException(String.join(messages, ' '));
    }
    if(!saveResult.success)
        throw new MetadataServiceExamplesException('Request failed with no specified error.');
}
    /*
    public static void UpdatePicklistField()
	{
	    MetadataService.MetadataPort service = createService();     
	    MetadataService.CustomField customField = new MetadataService.CustomField();
	    customField.fullName = 'Choose_Domain__c';
	    customField.label = 'Choose Domain';
	    customField.type_x = 'Picklist';
	    metadataservice.Picklist pt = new metadataservice.Picklist();
	    pt.sorted= false;
	    metadataservice.PicklistValue two = new metadataservice.PicklistValue();
	    two.fullName= 'second';
	    two.default_x=false ;
	    metadataservice.PicklistValue three = new metadataservice.PicklistValue();
	    three.fullName= 'third';
	    three.default_x=false ;
	    pt.picklistValues = new list<metadataservice.PicklistValue>{two,three};
	    customField.picklist = pt ;
	    MetadataService.UpdateMetadata ut = new MetadataService.UpdateMetadata();
	    ut.currentName='Lead.picklist__c';
	    ut.metadata= customField;	
	    MetadataService.AsyncResult[] results = service.UpdateMetadata(new List<MetadataService.UpdateMetadata> {ut});
	}
	
public static MetadataService.MetadataPort createService()
	{ 
		MetadataService.MetadataPort service = new MetadataService.MetadataPort();
		service.SessionHeader = new MetadataService.SessionHeader_element();
		service.SessionHeader.sessionId = UserInfo.getSessionId();
		return service;		
	}
    */
    public static MetadataService.MetadataPort createService()
	{ 
		MetadataService.MetadataPort service = new MetadataService.MetadataPort();
		service.SessionHeader = new MetadataService.SessionHeader_element();
		service.SessionHeader.sessionId = UserInfo.getSessionId();
		return service;		
	}
    
@Future(callout=true)
	public static void updatePicklistField(string pickval)
    {
        System.debug('inside update picklist'+pickval);
        MetadataService.MetadataPort service = createService();
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = 'Contact.Choose_Domain__c';
        customField.label = 'Choose Domain';
        customField.type_x = 'Picklist';
        metadataservice.Picklist pt = new metadataservice.Picklist();
        pt.sorted= false;
        metadataservice.PicklistValue domainvalue = new metadataservice.PicklistValue();
        domainvalue.fullName= pickval;
        domainvalue.default_x=false ;
        pt.picklistValues = new list<metadataservice.PicklistValue>{domainvalue};
        CustomField.picklist = pt ;
        List<MetadataService.SaveResult> results =
            service.updateMetadata(
                new MetadataService.Metadata[] { CustomField });
        handleSaveResults(results[0]);
    }
}
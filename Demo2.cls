public class Demo2{
List<Account> accounts;
    public static  List<Contact> lstcontact {set ; get ;}
    public static List<Opportunity> lstOpportunity {set ; get ;} 
    public list<Account> account{ set ; get;}
    public List<Account> accs{ set ; get;} 
    public Id AccountId{ set ; get;}
    public string name {set ; get ;}
    public Id id{set ; get;}
    public integer AccountNumber {set ; get ;}
    public static integer rowcountcontact {set ; get;}
    public static integer rowcountoppor {set ; get;}
    public static integer srno {set ; get;}
    private integer counter=0;  //keeps track of the offset
    private integer list_size=10; //sets the page size or number of rows
    public integer total_size; //used to show user the total size of the list
     Public string selectedname{get;set;}
        Public List<Selectoption> getselectedaccnamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
             lstnamesel.add(new selectOption('100','10'));
             lstnamesel.add(new selectOption('150','15'));
             lstnamesel.add(new selectOption('200','20'));
            return lstnamesel; 
        }
    public String selectedCountry2{get;set;}
public List<String> selectedCategories { get; set; }

public List<SelectOption> getCountriesOptions() {
        List<SelectOption> countryOptions = new List<SelectOption>();
        countryOptions.add(new SelectOption('','-None-'));
        countryOptions.add(new SelectOption('INDIA','India'));
        countryOptions.add(new SelectOption('USA','USA'));
        countryOptions.add(new SelectOption('United Kingdom','UK'));
        countryOptions.add(new SelectOption('Germany','Germany'));
        countryOptions.add(new SelectOption('Ireland','Ireland'));

        return countryOptions;
    }


    public List<SelectOption> getCategories() {

       List<SelectOption> categories = new List<SelectOption>();

    //   for(Case c : [Select sahi__MultiSelectPicklist__c from Case limit 10])

      //     categories.add(new SelectOption(c.sahi__MultiSelectPicklist__c, c.sahi__MultiSelectPicklist__c));

       return categories;

    }
    public PageReference save(){
        return null;
    }

   public Demo2() {
   total_size=[select count() from Account  WHERE Id IN (SELECT AccountId FROM Contact) AND Id IN (SELECT AccountId FROM Opportunity)];
      
System.debug('total size'+total_size);
   }
    public static boolean flagcontact {
         set { flagcontact=true; }
		 get { return flagcontact;}
    }
    public static  boolean flagoppor {
        set { flagoppor=true;}
 	    get { return flagoppor;}
    }
   
 
    public List<Account> getAccounts() {
           accounts = [select Id, Name from Account  WHERE Id IN (SELECT AccountId FROM Contact) AND Id IN (SELECT AccountId FROM Opportunity) limit :list_size offset :counter];
System.debug('list of account'+accounts);
         return accounts;
       
    }
    
  public PageReference Beginning() { //user clicked beginning
      counter = 0;
       System.debug('begining counter'+counter);
      return null;
   }

   public PageReference Previous() { //user clicked previous button
      counter -= list_size;
        System.debug('pre counter'+counter);
      return null;
   }

   public PageReference Next() { //user clicked next button
      counter += list_size;
       System.debug('next counter'+counter);
       System.debug('next list size'+counter);
      return null;
   }

   public PageReference End() { //user clicked end
      counter = total_size - math.mod(total_size, list_size);
        System.debug('end counter'+counter);
      return null;
   }

   public Boolean getDisablePrevious() { 
      //this will disable the previous and beginning buttons
      if (counter>0) return false; else return true;
   }

   public Boolean getDisableNext() { //this will disable the next and end buttons
      if (counter + list_size < total_size) return false; else return true;
   }

   public Integer getTotal_size() {
      return total_size;
   }

   public Integer getPageNumber() {
      return counter/list_size + 1;
   }

   public Integer getTotalPages() {
      if (math.mod(total_size, list_size) > 0) {
         return total_size/list_size + 1;
      } else {
         return (total_size/list_size);
      }
   }
    public PageReference doSubmit()
    {
        Id childcontactid = apexpages.currentpage().getparameters().get('accidcontact');
        System.debug('contact'+childcontactid);
        Id childopprid = apexpages.currentpage().getparameters().get('accidoppor');
        System.debug('oppor'+childopprid);
        if(childcontactid!=null)
        {
            flagcontact=true;
            Demo2.doContact(childcontactid);
        }
        if(childopprid!=null)
        {
            flagoppor=true;
            Demo2.doOppo(childopprid);
        }
        return null;
    }
    public PageReference ClearAll()
    {
        if(lstcontact!=null)
        {
        lstcontact.clear();
        }
        if(lstOpportunity!=null)
        {
        lstOpportunity.clear();
        }
        
        return null;
    }
    public static list<Contact> doContact(Id accid)
    {
        //Id myParam = apexpages.currentpage().getparameters().get('acc');
        //System.debug('acc'+myParam);
        lstcontact = [SELECT AccountId,Name,Email FROM Contact WHERE AccountId =:+accid];
        System.debug('lstContact'+lstcontact);
        rowcountcontact = lstcontact.size();
        
        return lstcontact;
    }
    public static list<Opportunity> doOppo(Id accid)
    {
        //string myParam = apexpages.currentpage().getparameters().get('acd');
        //System.debug('acd'+myParam);
        //rowcount = rowcount+1;
        lstOpportunity = [SELECT AccountId,Name,CloseDate FROM Opportunity WHERE AccountId =:+accid];
        System.debug('oppo'+lstOpportunity);
         rowcountoppor = lstOpportunity.size();
        return lstOpportunity;
    }
}
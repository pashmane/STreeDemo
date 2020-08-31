public class FormDisplayPageController {
Public string selectedname{get;set;}
    public boolean flag{set ; get ;}
    public string name {set ; get ;}
    public string bidpro{set ; get ;}
        Public List<Selectoption> getselectedaccnamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
		for(String name : gd.keyset())
			{
   		         lstnamesel.add(new selectoption(name,name));
			}
            return lstnamesel; 
        }
    public void setWeek()
    {
     System.debug('value..'+ApexPages.currentPage().getParameters().get('bidpro'));   
      name = selectedname;
        System.debug('name..'+selectedname);
        flag = true;
    }
    public PageReference clear()
    {
        return null;
    }
}
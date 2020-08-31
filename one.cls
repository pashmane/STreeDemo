public class one {
 	public string acName{set;get;} 
    public integer acPhone{set;get;} 
    public List<Account> accs{set;get;} 
    public string accid {set;get;} 

    public pagereference save(){ 
        //accid = apexpages.currentPage().getParameters().get('id'); 
        accs = [select id,name,phone,type from account limit 5]; 
        return null; 
    } 
}
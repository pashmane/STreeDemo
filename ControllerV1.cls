public class ControllerV1 {

    public String getAccount { get; set; }

    public String getLead { get; set; }
    public list<lead> getLead()
    {
        list<lead> lstObjLead = [Select Name,Id From Lead];
    return lstObjLead;
    }
     public list<Account> getAccount()
    {
        list<Account> lstObjAccount = [Select Name,Id From Account];
    return lstObjAccount;
    }
    
}
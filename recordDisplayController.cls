public class recordDisplayController {
    public list<sObject> lstAccount {set;get;}
    public list<string> lststring{set ; get ;}
    public string ControllerValue;
    public integer ControllerNumber;
     public string ControllerField1;
     public string ControllerField2;
    public Id controlleraccId {get;set;}
    public string controlleraccName {get;set;}

    
  public void setControllerValue (string s) {
    controllerValue=s; 
  }
    
  public string getControllerValue() {
    return controllerValue;
  } 
    public void setControllerNumber (integer n) {
    controllerNumber=n; 
  }
    
  public integer getControllerNumber() {
    return controllerNumber;
  } 
    public void setControllerField1(string s) {
    controllerField1=s; 
  }
    
  public string getControllerField1() {
    return controllerField1;
  } 
    public void setControllerField2 (string s) {
    controllerField2=s; 
  }
    
  public string getControllerField2() {
    return controllerField2;
  } 
    public list<string> getlstrecordstring()
        {
    
            return lststring;
        }
    
	public list<sObject> getlstRecords()
    {
         System.debug('ControllerValue'+ControllerValue);
    System.debug('ControllerField1'+ControllerField1);
     System.debug('ControllerField2'+ControllerField2);
     System.debug('ControllerNumber'+ControllerNumber);
       //String query = 'SELECT'+ControllerField1 + ','+ ControllerField2 + 'FROM' + ControllerValue + 'LIMIT : ' +ControllerNumber;
       lstAccount = Database.query('SELECT '+ControllerField1+' , '+ControllerField2+' FROM '+ControllerValue+' LIMIT '+ControllerNumber);
      
        System.debug('lstAccount '+lstAccount);
        return lstAccount;
    }
    
}
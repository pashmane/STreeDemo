public class DynamicFormControllerHandler {
    
public static list<String> lstHeading ;
    public static list<String> lstLabels;
    public static list<String> lstValue;
    
    public DynamicFormControllerHandler()
    {
        
    }
    public DynamicFormControllerHandler(String name1,String name2,String name3)
    {
       lstHeading=null; 
        lstLabels=null;
        lstValue=null;
    }
    
    public static void setlstHeading(String head)
    {
        lstHeading.add(head);
    }
    public static list<String> getlstHeading()
    {
        return lstHeading;
    }
    public static void setlstLabels(String head)
    {
        lstLabels.add(head);
    }
    public static list<String> getlstLabels()
    {
        return lstLabels;
    }
    public static void setlstValue(String head)
    {
        lstValue.add(head);
    }
    public static list<String> getlstValue()
    {
        return lstValue;
    }
}
global class MyArray2 {
public static String name2;
    global MyArray2(String name)
    {
        name2=name;
    }
 	global static String getName()
    {
        return 'Hello '+name2;
    }
  
}
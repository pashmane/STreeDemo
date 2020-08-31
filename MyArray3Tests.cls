@isTest
public class MyArray3Tests {
@isTest static void getMessageTest()
	{
    String strExpectedResult = ' Mane';
  	String strActualResult;
    MyArray3 objMyArray3 = new MyArray3();
    strActualResult = objMyArray3.displayMyArray3();
    system.assertEquals(strExpectedResult, strActualResult);
	}
}
@isTest
public class MyArrayTests {
   
    @isTest static void getMessageTest()
    {
     String strExpectedResult='Hello Prashant'; 
   	 String strActualResult;
     MyArray sampleMyArray = new MyArray();
     strActualResult =sampleMyArray.getMessage('Prashant');
    system.assertEquals(strExpectedResult, strActualResult);
	}

}
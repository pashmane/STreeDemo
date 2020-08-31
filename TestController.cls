global class TestController {
    webservice static string method1(ID tid){
	RestApexTrigger.createApexTrigger();       
        return 'hello';
    }
}
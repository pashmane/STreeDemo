global class LogRecords {
    Exception name;
    string stacktrace;
global LogRecords(Exception n,string stacktr)
		{
    		name=n;
            stacktrace=stacktr;
            System.debug('exception '+name);
            System.debug('stack trace '+stacktrace);
		}
}
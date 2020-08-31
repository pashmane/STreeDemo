public class LeadControllerDisplayRecords {
public List<Lead> getLead() {
        List<Lead> results = Database.query(
            'SELECT Id, Name,City ' +
            'FROM Lead ' +
            'LIMIT 10'
    );
    return results;
}

}
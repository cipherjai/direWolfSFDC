public class NewCaseListController {
    
    private String filterStatus = 'New';
    public List<Case> newCases{get;set;}
    
    public NewCaseListController(){
        getNewCases();
    }
    public List<Case> getNewCases(){
        string query = 'SELECT Id, CaseNumber FROM Case WHERE status =: filterStatus LIMIT 10';
        newCases = Database.query(query);
        System.debug('newCases-->'+newCases);
        return newCases;
    }
}
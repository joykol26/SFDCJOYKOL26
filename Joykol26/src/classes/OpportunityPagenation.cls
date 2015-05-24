public with sharing class OpportunityPagenation {
    public List<Opportunity> accounts{get;set;}
    public Integer pageSize{get;set;}
    public Integer noOfPages{get;set;}
    public Integer pageNumber{get;set;}
    private String baseQuery = 'SELECT Name,Amount FROM Opportunity ORDER BY LastActivityDate ASC NULLS FIRST';
    private Integer totalNoOfRecs;
       
    public OpportunityPagenation(ApexPages.StandardController controller) {
        pageSize = 10;
        totalNoOfRecs = [select count() from Opportunity limit 50000];
        getInitialAccountSet();
    }
    
    public PageReference getInitialAccountSet()
    {
        pageNumber = 0;
        noOfPages = totalNoOfRecs/pageSize;
        
        if (Math.mod(totalNoOfRecs, pageSize) > 0)
            noOfPages++;
        
        try{
            accounts = Database.query(baseQuery + ' limit '+pageSize);
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
        return null;
    }
    
    public PageReference next(){
        pageNumber++;
        
        queryAccounts();
        return null;
    }
    public PageReference previous(){
        pageNumber--;
        if (pageNumber < 0)
            return null;
        
        queryAccounts();
        return null;
    }
    
    private void queryAccounts()
    {
        Integer offset = pageNumber * pageSize;
        String query = baseQuery + ' limit '+pageSize +' offset '+ offset;
        System.debug('Query is'+query);
        try{
            accounts = Database.query(query);
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
    }
}
public with sharing class OpportunityRecordFetchPOC {

    private final integer listLimit;
    public String opportunities { get; set; }
    public List<Opportunity> attended {get;set;}
    public List<Opportunity> oldAttended ;
    public Opportunity opp;
    public List<Opportunity> accounts{get;set;}
    public Integer pageSize{get;set;}
    public Integer noOfPages{get;set;}
    public Integer pageNumber{get;set;}
    private String baseQuery = 'SELECT Name,Amount FROM Opportunity ORDER BY ID ASC NULLS FIRST ';
    private Integer totalNoOfRecs;
    public Integer forRecCnt{get;set;}
    
    public OpportunityRecordFetchPOC()
    {   pageSize = 10;
        totalNoOfRecs = [select count() from Opportunity limit 50000];
       attended = new List<Opportunity>();
        System.debug('CP!!!!!!!!!!!!!!!!!!');
        attended = [SELECT Name,Amount FROM Opportunity];
           System.debug('size============='+attended.size());   
        getInitialAccountSet();
         oldAttended=new List<Opportunity>();
             
             for(Opportunity opp : attended){
             Opportunity oppNew = new Opportunity(id=opp.id,name=opp.name,amount=opp.amount);
             oldAttended.add(oppNew );
             }          
        
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
    public PageReference SaveInline()
{
     List<Opportunity> toBeUpdated=new List<Opportunity>() ;
     for(Opportunity opp:attended)
    {
    for(Opportunity oppnOld:OldAttended)
    {
        system.debug('OLD VAL>>>>>>>>>>>>>>>>>>>>>>>>>>>>'+oppnOld.id+''+oppnOld.name+''+oppnOld.amount);
        system.debug('NEW VAL>>>>>>>>>>>>>>>>>>>>>>>>>>>>'+opp.id+''+opp.name+''+opp.amount);
    
        if((oppnOld.id==opp.id)&&(oppnOld.amount!=opp.amount))
        {
        toBeUpdated.add(opp);
         }
        else
        {
        System.debug('Amount Same');
        }
    }   
     
}
System.debug('Size=================='+toBeUpdated.size());
   update toBeUpdated;

   return ApexPages.CurrentPage(); 
}
}
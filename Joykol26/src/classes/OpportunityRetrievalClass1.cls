public with sharing class OpportunityRetrievalClass1 {
    
    public List<Opportunity> accounts{get;set;}
    public Integer pageSize{get;set;}
    public Integer noOfPages{get;set;}
    public Integer pageNumber{get;set;}
    private String baseQuery = 'select Id, Name,Amount from Opportunity ORDER BY LastActivityDate ASC NULLS FIRST';
    private Integer totalNoOfRecs;    
    public String opportunities { get; set; }
    public List<Opportunity> attended {get;set;}
    public List<Opportunity> oldAttended ;
    public Map<id, Opportunity> oppMap{get;set;}
    public List<Opportunity> oppCurrent;
    public Opportunity opp;
    
    public OpportunityRetrievalClass1() {   
         attended = new List<Opportunity>();            
         pageSize = 10;
         
         totalNoOfRecs = [select count() from Opportunity limit 50000];         
         pageNumber = 0;
         noOfPages = totalNoOfRecs/pageSize;
         if(Math.mod(totalNoOfRecs, pageSize) > 0)
         noOfPages++;
         try{
            attended = Database.query(baseQuery + ' limit '+pageSize);
            }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
        
          oldAttended=new List<Opportunity>();
          system.debug('size of totalNoOfRecs='+totalNoOfRecs);
          oppMap = new Map<id,Opportunity>();
          for(Opportunity opp : attended){
             Opportunity oppNew = new Opportunity(id=opp.id,name=opp.name,amount=opp.amount);
             oldAttended.add(oppNew);
             oppMap.put(opp.id,opp);
         }                     
    }
    
 public PageReference getInitialAccountSet(){  
       pageNumber = 0;
       noOfPages = totalNoOfRecs/pageSize;
       if (Math.mod(totalNoOfRecs, pageSize) > 0)
            noOfPages++;
       try{
       oppCurrent= Database.query(baseQuery + ' limit '+pageSize);
       oppMap.clear();
       oldAttended.clear();
       for(Opportunity varopp:oppCurrent){
       oppMap.put(varopp.id,varopp);
       Opportunity oppNew = new Opportunity(id=varopp.id,name=varopp.name,amount=varopp.amount);
       oldAttended.add(oppNew);
       }       
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
    
    private void queryAccounts(){
         Integer offset = pageNumber * pageSize;
         String query = baseQuery + ' limit '+pageSize +' offset '+ offset;
         try{
         oppCurrent= Database.query(query );
         oppMap.clear();
         oldAttended.clear();
         for(Opportunity varopp:oppCurrent){
         oppMap.put(varopp.id,varopp);
         Opportunity oppNew = new Opportunity(id=varopp.id,name=varopp.name,amount=varopp.amount);
         oldAttended.add(oppNew);
         }       
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
    }    

public PageReference SaveInline()
{
	system.debug('size of oppMap='+oppMap.size()+'size of oldAttended='+oldAttended.size());
    list<Opportunity> oppMapVal = new list<Opportunity>();
    for(Opportunity oppOld:oldAttended){
    	
    	//if(String.valueOf(oppOld.Amount)!= '' && String.valueOf(oppOld.Amount)!= null){
    	if(oppMap.get(oppOld.id)!=null){
    	system.debug('old id and value='+oppOld.id+'\t '+oppOld.name+'\t'+oppOld.Amount + 'new id and amount='+oppMap.get(oppOld.id).name+'\t'+oppMap.get(oppOld.id).id+'\t'+oppMap.get(oppOld.id).Amount);
    		if(oppMap.get(oppOld.id).Amount!=oppOld.Amount){
    			System.debug('Chking ID>>>>>>>>'+oppOld.id);
    			System.debug('Chking old Amnt & new Amnt>>>>>>>>'+oppOld.Amount+'\t'+oppMap.get(oppOld.id).Amount);
            oppMapVal.add(oppMap.get(oppOld.id));
       // }
    		}
    	}
       
    }
   update oppMapVal;
   return ApexPages.CurrentPage(); 

}   
}
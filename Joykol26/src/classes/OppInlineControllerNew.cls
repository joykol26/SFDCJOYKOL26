public with sharing class OppInlineControllerNew {
    public String opportunities { get; set; }
    public List<Opportunity> attended {get;set;}
    public List<Opportunity> oldAttended ;
    public Opportunity opp;
    
    public OppInlineControllerNew() {
             attended = new List<Opportunity>();
             attended = [select Id, Name,Amount from Opportunity  ];
             oldAttended=new List<Opportunity>();
             
             for(Opportunity opp : attended){
             Opportunity oppNew = new Opportunity(id=opp.id,name=opp.name,amount=opp.amount);
             oldAttended.add(oppNew );
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
        System.debug('Amount Same Inline');
        }
    }   
     
}
   update toBeUpdated;

   return ApexPages.CurrentPage(); 
}

}
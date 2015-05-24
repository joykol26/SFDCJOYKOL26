public with sharing class OppInlineController {

    public PageReference edit() {
        return null;
    }


    public PageReference save() {
        return null;
    }


    public String opportunities { get; set; }

   public List<Opportunity> attended {get;set;}


    public OppInlineController() {
             attended = new List<Opportunity>();
             attended = [select Id, Name,Amount from Opportunity  ];
             
    }
     public PageReference cancel() {
        return null;
    }

public Opportunity opp;



 
public PageReference SaveInlineChanges()
{
    system.debug('***In FC');
    system.debug(attended);
    update attended;
    return ApexPages.CurrentPage();
}
}
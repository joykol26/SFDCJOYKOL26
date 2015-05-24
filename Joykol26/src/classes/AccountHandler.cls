/**
002
 * Class AccountHandler
003
 *
004
 * Trigger Handler for the Account SObject. This class implements the ITrigger
005
 * interface to help ensure the trigger code is bulkified and all in one place.
006
 */

public with sharing class AccountHandler

    implements ITrigger

{  

    // Member variable to hold the Id's of Accounts 'in use'

    private Set<Id> m_inUseIds = new Set<Id>();

     

    // Member variable to record Audit records

    private List<Audit__c> m_audits = new List<Audit__c>();

     

    // Constructor

    public AccountHandler()

    {

    }

 

    /**
022
     * bulkBefore
023
     *
024
     * This method is called prior to execution of a BEFORE trigger. Use this to cache
025
     * any data required into maps prior execution of the trigger.
026
     */

    public void bulkBefore()

    {

        // If this a delete trigger Cache a list of Account Id's that are 'in use'

        if (Trigger.isDelete)

        {

            // pre load all the in use projects passed to this trigger

            m_inUseIds = AccountGateway.findAccountIdsInUse(Trigger.oldMap.keySet());

        }

    }

     

    public void bulkAfter()

    {

    }

         

    public void beforeInsert(SObject so)

    {

    }

     

    public void beforeUpdate(SObject oldSo, SObject so)

    {

    }

     

    /**
050
     * beforeDelete
051
     *
052
     * This method is called iteratively for each record to be deleted during a BEFORE
053
     * trigger.
054
     */

    public void beforeDelete(SObject so)

    {  

        // Cast the SObject to an Account

        Account myAccount = (Account)so;

         

        // Examine the Set and if the account is in use don't allow it to be deleted.  

        if (m_inUseIds.contains(myAccount.Id))

        {

            // Add the error to the offending object

            so.addError('You cannot delete an Account that is in use.');

        }

        else

        {

            // Add an audit record to the list

            Audit__c myAudit = new Audit__c();

            myAudit.Description__c = 'Account Name: ' + myAccount.Name + ' (Id: ' + myAccount.Id + ') was deleted';

             

            m_audits.add(myAudit);

        }

    }

     
    public void afterInsert(SObject so)

    {

    }

     

    public void afterUpdate(SObject oldSo, SObject so)

    {

    }

     

    public void afterDelete(SObject so)

    {

    }

     
    /**
089
     * andFinally
090
     *
091
     * This method is called once all records have been processed by the trigger. Use this
092
     * method to accomplish any final operations such as creation or updates of other records.
093
     */

    public void andFinally()
    
    {

        // insert any audit records

        if (!m_audits.isEmpty())

        {

            insert m_audits;

        }

    }

}
public without sharing class AccountGateway

{

    /**
09
     * Returns a subset of id's where there are any records in use.
10
     *
11
     * Arguments:   Set<Id> accIds - Set of Account Id's to examine
12
     *
13
     * Returns:     Set<Id> - Set of Account Id's that are 'in use'
14
     */

    public static Set<Id> findAccountIdsInUse(Set<Id> accIds)

    {

        Set<Id> inUseIds = new Set<Id>();

         

        for (Account[] accounts : [Select p.Id, (Select Id From Opportunities Limit 1) From Account p where p.Id in : accIds])

        {  

            for (Account acc : accounts)

            {

                if (acc.Opportunities.size() > 0)

                {

                    inUseIds.add(acc.id);

                }

            }

        }

         
        return inUseIds;

    }

}
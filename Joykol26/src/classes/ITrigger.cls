public interface ITrigger

{

    /**
08
     * bulkBefore
09
     *
10
     * This method is called prior to execution of a BEFORE trigger. Use this to cache
11
     * any data required into maps prior execution of the trigger.
12
     */

    void bulkBefore();

     

    /**
16
     * bulkAfter
17
     *
18
     * This method is called prior to execution of an AFTER trigger. Use this to cache
19
     * any data required into maps prior execution of the trigger.
20
     */

    void bulkAfter();

     

    /**
24
     * beforeInsert
25
     *
26
     * This method is called iteratively for each record to be inserted during a BEFORE
27
     * trigger. Never execute any SOQL/SOSL etc in this and other iterative methods.
28
     */

    void beforeInsert(SObject so);

     

    /**
32
     * beforeUpdate
33
     *
34
     * This method is called iteratively for each record to be updated during a BEFORE
35
     * trigger.
36
     */

    void beforeUpdate(SObject oldSo, SObject so);

 

    /**
40
     * beforeDelete
41
     *
42
     * This method is called iteratively for each record to be deleted during a BEFORE
43
     * trigger.
44
     */

    void beforeDelete(SObject so);

 

    /**
48
     * afterInsert
49
     *
50
     * This method is called iteratively for each record inserted during an AFTER
51
     * trigger. Always put field validation in the 'After' methods in case another trigger
52
     * has modified any values. The record is 'read only' by this point.
53
     */

    void afterInsert(SObject so);


    /**
57
     * afterUpdate
58
     *
59
     * This method is called iteratively for each record updated during an AFTER
60
     * trigger.
61
     */

    void afterUpdate(SObject oldSo, SObject so);
 
    /**
65
     * afterDelete
66
     *
67
     * This method is called iteratively for each record deleted during an AFTER
68
     * trigger.
69
     */

    void afterDelete(SObject so);

 
    /**
73
     * andFinally
74
     *
75
     * This method is called once all records have been processed by the trigger. Use this
76
     * method to accomplish any final operations such as creation or updates of other records.
77
     */

    void andFinally();

}
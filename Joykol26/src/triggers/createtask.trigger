trigger createtask on task (after insert, after update ){
set<id> caseId=new set<id>();
List<Case> casepId=new List<Case>();
List<CaseComment> NewComment = new List<CaseComment>();
for(Task ts : trigger.new)
{
caseId.add(ts.whatid);
casepId=[Select id from Case where id in :caseId];
if(String.valueOf(ts.whatId).startsWith('500')==TRUE)
{
System.debug('*************TEST');
for(Case ca : casepId )
{
CaseComment com = new CaseComment();
com.ParentId = ca.id;
com.CommentBody= 'This is the comment body';
NewComment.add(com) ;
}
insert NewComment;
System.debug('*************TEST Completed');
}
}
}
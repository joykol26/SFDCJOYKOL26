public class sc33{
 Public string acid{set;get;}
 public list<account> acc{set;get;}
 ID id;
 
public sc33(){
 acc=[select id,name from account];
}
public pagereference dodelete(){
 account a=new account();
 id = apexpages.currentpage().getparameters().get('acid'); 
 List<Account> lstAccount  =  Database.query('SELECT Id FROM Account WHERE id = :id');
 delete lstAccount;
 return null;
 }
}
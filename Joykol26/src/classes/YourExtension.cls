public class YourExtension{

/*String result;

public String getResult()
{return result;}
public void setResult()
{
result=sObjectType ;
}
*/

   public String sObjectType {get;set;} 
   public YourExtension(ApexPages.StandardController controller) {
      
       sObjectType = String.valueOf(controller.getRecord().getSObjectType());
       System.debug('**** output'+sObjectType );     

    }
    
}
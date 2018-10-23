public class ContactController {
    public ContactController(ApexPages.StandardController controller){
        
    }
    
    public static PageReference traverseToEditPAge(){
        PageReference pr = new PageReference('/apex/ContactEdit');
        pr.setRedirect(true);
        return pr;
    }
}
({
	packItem : function(component, event, helper) {
		console.log("button was clicked!! ");
        var  a = component.get("v.item", true);
        a.Packed__c = true;
        component.set("v.item", a)
        component.set("v.message", (event.getSource()).get("v.label"));
        (event.getSource()).set("v.disabled", true)
    }    
})
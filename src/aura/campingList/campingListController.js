({
	clickCreateItem: function(component, item) {
        var validItem  = component.find('campinglistitemform').reduce(function(validSoFar, inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validItem){
            var newItem = component.get("v.newItem");
            console.log("Create Item: " + JSON.stringify(newItem));
            createItem(component, newItem);
        }
    },
    createItem: function(component, item) {
        var theItem = component.get("v.items");
 
        // Copy the theItem to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
        var newItem = JSON.parse(JSON.stringify(item));
 		console.log("Expenses before 'create': " + JSON.stringify(theItem));
        theItem.push(newItem);
        component.set("v.items", theItem);
        component.set("v.newItem", {'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});
        // Notifying that the component has changed 
        console.log("Item after 'create': " + JSON.stringify(theItem));    
}
})
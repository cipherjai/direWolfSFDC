({
    fetchContacts : function(component, event, helper) {
        // add an action which is going into global action queue, fetch all the contact list from the apex controller 
        var action = component.get("c.getContacts");
        var accountId = component.get("v.recordId");
        action.setParams({
            accountIds: accountId
        });
        action.setCallback(this, function(response){
            var state = response.getState(); // can be succ , err, incomplete
            if(state === 'SUCCESS'){
                var contactList = response.getReturnValue();
                component.set("v.contactList", contactList);
                console.log(contactList);
            }
            else{
                alert('Error in getting Data');
            }
        });
        $A.enqueueAction(action);
    },
    
    saveContacts: function(component, even, helper){
        var contactList = component.get('v.contactList');
        var recordViewForm = component.find('recordViewForm');
        var recordEditForm = component.find('recordEditForm');
        var saveAction = component.get('c.saveContactList');
        var toastEvent =  $A.get('e.force:showToast')
        saveAction.setParams({
            contactList: contactList
        });
        
        saveAction.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var dataMap = response.getReturnValue();
                // One App Container 
                Toast
                if(dataMap.status == 'success' ){
                    $A.util.addClass(recordEditForm, 'formHide');
                    $A.util.removeClass(recordViewForm, 'formHide');
                    btn.set('v.name', 'edit');
                    btn.set('v.label', 'Edit');
                    toastEvent.setParams({
                        'title': 'Success!',
                        'type' : 'success',
                        'mode' : 'dismissable',
                        'message' : dataMap.message
                    });
                }
                else if(dataMap.status == 'error'){
                    toastEvent.setParams({
                        'title': 'Success!',
                        'type' : 'success',
                        'mode' : 'dismissable',
                        'message' : dataMap.message });
                    toastEvent.fire();
                }
            }
            else{
                alert('Error in getting data');
            }
        });
    }
})
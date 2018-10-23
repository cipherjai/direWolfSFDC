({
	handleClick : function(component, event, helper) {
		console.log("Clicked the button!! ");   
       	
		component.set("v.message", (event.getSource()).get("v.label"));     // update our message        
	}
    
    
})
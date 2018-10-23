<aura:application >
	<head>    <!-- Global Site Tag (gtag.js) - Google Analytics -->
    </head>
    <script src="https://www.googletagmanager.com/gtag/js?id=UA-127512364-1" async="true"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        
        gtag('config', 'UA-127512364-1');
    </script>
    
    <h1>Hello Google Analytics is working Here !</h1>
    
    <lightning:button label="Search" onclick="{!c.doSomething}"/>
    
</aura:application>
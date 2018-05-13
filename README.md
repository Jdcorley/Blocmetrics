#Blocmetrics is an analytics service that allows users register applications
#and track their event data. 


## USE to report event data through blocmetrics 

```
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = {event: {name: eventName}};
    var request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:3000/api/events', true)
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };
```



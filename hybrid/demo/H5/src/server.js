const wss = require('ws')
const server = new wss.Server({
  port: 3005
})

const data = {
  "TLE":false,
  "data":{
      "businessCode":"LP00180740560419",
      "height":10.41,
      "length":18.55,
      "weight":0,
      "width":13.94
  },
  "devId":"19073030209",
  "errCode":0,
  "errMsg":"",
  "message":null,
  "messageType":2,
  "success":true,
  "type":12
}

server.on('connection', function(ws){

  console.log('client connected');

  ws.on('open', function() {
   
  })

  ws.on('message', function(evt) {
    console.log('message:', evt);
    // setInterval(function(){
      console.log('server send: ...',)
      ws.send(JSON.stringify(data));
    // }, 200);
  })

})



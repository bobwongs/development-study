var port = 3001;

var server = require('http').createServer();
var io = require('socket.io')(server);
io.on('connection', function(client){
  socket.on('connect', function(){  //建立socket连接时候触发   
    console.log('connect a socket client');
  });

  socket.on('message', function(){  //接收socket连接消息的时候触发
    console.log('received a message');
});

  client.on('event', function(data){
    console.log('mydata: ' + data);
  });
  
  client.on('disconnect', function(){
    console.log('disconnent the connect');
  });
});
server.listen(port ,function() {
    console.log('Server listening at port %d', port);
});
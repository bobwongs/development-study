var http = require('http');
var url = require('url');

http.createServer(function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});

  // 解析 url 参数
//   var params = url.parse(req.url, true).query;
//   res.write('Name: ' + params.name);
//   res.write('\n');
//   res.write('age ' + params.age);
  res.write('HTML');
//   res.end('END');
  res.end();
}).listen(8888);

console.log('log');
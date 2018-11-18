var http = require("http");

function onRequest(request, response) {
  if (request.url = '/home') {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.write('/home');
    response.end();
  }
  else if (request.url = '/getData') {
    myObj = {"name":"Nathan","class":"cs313"};
  }
  else {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.write('Error 404: Page not found');
    response.end();
  }
}

var server = http.createServer(onRequest);

server.listen(8888);

console.log("Server is listening");

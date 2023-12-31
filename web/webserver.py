import http.server
import socketserver

class MyRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.path = '/html/index.html'
        if self.path == '/testme/':
            self.path = '/html/test.html'
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

Handler = MyRequestHandler
server = socketserver.TCPServer(('0.0.0.0', 8080), Handler)

try:
	server.serve_forever()
except KeyboardInterrupt:
	server.server_close()
    # print("Server Closed")
    
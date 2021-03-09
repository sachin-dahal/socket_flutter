import 'package:socket_io/socket_io.dart';

void main() {
  connectServer();
}

//TODO: FIX THE SERVER ERROR
//* type '(Socket) => Null' is not a subtype of type '(dynamic) => dynamic' of 'handler'
connectServer() {
  // try {
  //   var io = Server();
  //   var nsp = io.of('/some');
    
  //   nsp.on('connection', (Socket client) {
  //     print('connection /some');
  //     client.on('msg', (data) {
  //       print('data from /some => $data');
  //       client.emit('fromServer', "ok 2");
  //     });
  //     return null;
  //   });
  //   io.on('connection', (Socket client) {
  //     print('connection default namespace');
  //     client.on('msg', (data) {
  //       print('data from default => $data');
  //       client.emit('fromServer', "ok");
  //     });
  //     return null;
  //   });
  //   io.listen(3000);
  // } catch (err) {
  //   print("Exception Here");
  //   print(err);
  // }
}

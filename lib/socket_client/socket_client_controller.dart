import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io/socket_io.dart';

class SocketClientController extends GetxController {
  StreamSocket _streamSocket = StreamSocket();
  TextEditingController _textController;

  StreamSocket get streamSocket => _streamSocket;
  TextEditingController get textController => _textController;

  @override
  void onInit() {
    super.onInit();
    _textController = TextEditingController();
  }

  //void conn() async => await connectServer();

  // connectServer() {
  //   try {
  //     var io = Server();
  //     var nsp = io.of('/some');
  //     nsp.on('connection', (Socket client) {
  //       print('connection /some');
  //       client.on('msg', (data) {
  //         print('data from /some => $data');
  //         client.emit('fromServer', "ok 2");
  //       });
  //       return null;
  //     });
  //     io.on('connection', (Socket client) {
  //       print('connection default namespace');
  //       client.on('msg', (data) {
  //         print('data from default => $data');
  //         client.emit('fromServer', "ok");
  //       });
  //       return null;
  //     });
  //     io.listen(3000);
  //   } catch (err) {
  //     print("Exception Here");
  //     print(err);
  //   }
  // }

  // call this to get connected
  void connectToSocket() {
    IO.Socket socket = IO.io(
      'http://10.0.2.2:3000',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((data) {
      print("CONNECTED...");
      socket.emit('msg', 'test');
    });

    // handling the event
    socket.on('event', (data) => _streamSocket.addResponse);
    socket.onDisconnect((data) {
      print("Disconnected");
      _streamSocket.dispose();
    });
  }
}

// creating the stream to handle events
class StreamSocket {
  final _socketController = StreamController<String>();

  void Function(String) get addResponse => _socketController.sink.add;

  Stream<String> get getResponse => _socketController.stream;

  void dispose() {
    _socketController.close();
  }
}

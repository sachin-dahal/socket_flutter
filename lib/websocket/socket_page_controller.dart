import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketController extends GetxController {
  WebSocketChannel _socketChannel;
  TextEditingController _textController;

  WebSocketChannel get socket => _socketChannel;
  TextEditingController get textController => _textController;

  @override
  void onInit() {
    super.onInit();
    _textController = TextEditingController();
    _socketChannel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  sendText() {
    if (_textController.text.isNotEmpty) {
      _socketChannel.sink.add(_textController.text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _socketChannel.sink.close();
  }
}

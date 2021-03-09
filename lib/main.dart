import 'package:flutter/material.dart';
import 'package:socket_flutter/socket_client/socket_client.dart';
import 'package:socket_flutter/websocket/socket_page.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Socket Demo",
      //home: SocketClient(),
      home: SocketPage(),
    );
  }
}

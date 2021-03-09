import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_flutter/socket_client/socket_client_controller.dart';

class SocketClient extends StatelessWidget {
  final SocketClientController _socketController =
      Get.put(SocketClientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: Column(
          children: [
            Tooltip(
              message: "This should be called at main method",
              child: OutlinedButton(
                onPressed: _socketController.connectToSocket,
                child: Text("CONNECT FIRST"),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _socketController.textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(15.0),
              ),
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              },
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {},
              //onPressed: _socketController.sendText,
              child: Text("Send"),
            ),
            SizedBox(height: 30.0),
            StreamBuilder(
              stream: _socketController.streamSocket.getResponse,
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData ? '${snapshot.data}' : "No Data",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

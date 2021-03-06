import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_flutter/socket_page_controller.dart';

class SocketPage extends StatelessWidget {
  final SocketController _socketController = Get.put(SocketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: Column(
          children: [
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
                _socketController.sendText();
                FocusScope.of(context).unfocus();
              },
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: _socketController.sendText,
              child: Text("Send"),
            ),
            SizedBox(height: 30.0),
            StreamBuilder(
              stream: _socketController.socket.stream,
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

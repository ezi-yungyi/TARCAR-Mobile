import 'package:flutter/material.dart';
import 'ServerService.dart';

class WebSocketPage extends StatefulWidget {
  @override
  _WebSocketPageState createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  late ServerService _webSocketService;

  @override
  void initState() {
    super.initState();
    _webSocketService = ServerService();
    _webSocketService.connect('wss://tarcar-broadcast.multixers.cloud/app/w3jnxnld3zaxbxwobmmn');
    _webSocketService.subscribeToChannel('parking-spot-status');
    _webSocketService.messageStream.listen((message) {
      // Handle incoming message and update parking data
      print(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverb WebSocket Example'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<String>(
              stream: _webSocketService.messageStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data.toString()),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          TextField(
            onSubmitted: (message) {
              // 发送消息到 WebSocket
              _webSocketService.sendMessage(message);
            },
            decoration: InputDecoration(hintText: "Send a message"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _webSocketService.dispose(); // 关闭 WebSocket 连接
    super.dispose();
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class ServerService {
  late WebSocketChannel _channel;
  late StreamController<String> _messageController;

  Stream<String> get messageStream => _messageController.stream;

  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _messageController = StreamController<String>();

    // Listen to incoming messages
    _channel.stream.listen(
          (message) {
        _messageController.add(message);
      },
      onDone: () {
        _messageController.close();
      },
      onError: (error) {
        print('Error: $error');
      },
    );
  }

  // Send subscription message to the WebSocket server to subscribe to a channel
  void subscribeToChannel(String channelName) {
    // Construct the subscription message for the channel
    final subscribeMessage = json.encode({
      "event": "pusher:subscribe",
      "data": {
        "channel": channelName,
      }
    });

    // Send the subscription message to the WebSocket server
    _channel.sink.add(subscribeMessage);

  }


  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  void dispose() {
    _channel.sink.close();
  }

  // To handle parking updates
  void updateParkingData(String message) {
    // Convert the Map data to JSON string before adding to the stream
    Map<String, dynamic> data = json.decode(message);  // Assuming message is JSON string
    _messageController.add(json.encode(data));  // Convert Map to String
  }
}
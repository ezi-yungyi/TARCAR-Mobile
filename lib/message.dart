import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  final TextEditingController _controller = TextEditingController();
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _databaseReference.child('messages').onValue.listen((event) {
      final List<String> messages = [];
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        data.forEach((key, value) {
          messages.add(value['text']);
        });
      }
      setState(() {
        _messages = messages;
      });
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _databaseReference.child('messages').push().set({
        'text': _controller.text,
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
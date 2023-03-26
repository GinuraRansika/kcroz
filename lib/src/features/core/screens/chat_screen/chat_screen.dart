import 'dart:html';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text('Anne Marie', style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],

      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                      final bool isMe = document['user'] == 'Hayat'; // replace with your user ID
                      final messageAlignment = isMe ? TextAlign.right : TextAlign.left;
                      return ListTile(
                        title: Text(
                          document['text'],
                          textAlign: messageAlignment,
                          style: TextStyle(
                            fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        subtitle: Text(
                          document['user'],
                          textAlign: messageAlignment,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Type a message',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('messages')
                          .add({
                        'text': _textController.text,
                        'user': 'Hayat',
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                      _textController.clear();
                    },
                  ),
                ],
              ),
            ),



          ]
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
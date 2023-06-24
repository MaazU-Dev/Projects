import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
dynamic loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = '/1';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController= TextEditingController();

  String? message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userValidation();
  }

  void userValidation() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await _firebaseFirestore.collection('messages').get();
    print(messages);
    for (var message in messages.docs) {
      print(message.get('sender'));
      print(message.get('text'));
    }
    print('------------------------');
  }

  //    final messages= await _firebaseFirestore.collection('messages').get();
  // instead of waiting on the above method to get messages, which returns a future
  // We use, _firebaseFirestore.collection('messages').snapshots(),
  // It returns a stream of QuerySnapshots, which a list of futures
  // by suscribing to the stream through _firebaseFirestore.collection('messages').snapshots(),
  // we are gonna listen to the changes that happen to the .collection('messages')
  // As soon as their is a change, our app listen to it and prints messages!

  void messagesStream() async {
    await for (var snapshot
        in _firebaseFirestore.collection('messages').snapshots()) {
      //this snpashot is a firebase Query snapshot
      for (var messages in snapshot.docs) {
        print(messages.get('text'));
        print(messages.get('sender'));
      }
      print('------------------------------');
    }
    print('=================================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                 _auth.signOut();
                Navigator.pop(context);

                //Testing
/*
                getMessages();
*/
/*
                messagesStream();
*/
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Implement send functionality.
                      messageTextController.clear();

                      _firebaseFirestore.collection('messages').add({
                        'text': message,
                        'sender': loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color:Colors.blueAccent,
            ),
          );
        }
          final messages = snapshot.data?.docs;
          //snapshot is an async snapshot from flutter, which is accessing its own data property

          List<MessageBubble> messagewidgets = [];

        for (var message in messages!) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            //message is a document snapshot from firebase

            final currentUser= loggedInUser.email;

            final texts= MessageBubble(text: messageText, sender: messageSender, checker: currentUser==messageSender,);
            messagewidgets
                .add(texts);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0,),
              children: messagewidgets,
            ),
          );

      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.text, required this.sender, required this.checker}) ;

  final String? text;
  final String? sender;
  final bool checker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0,),
      child: Column(
        crossAxisAlignment: checker ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender!, style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),),
          Material(
            elevation: 10.0,
            color: checker ? Colors.blueGrey : Colors.white60,
            borderRadius: BorderRadius.circular(25.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text('$text',
              style: TextStyle(
                fontSize: 15.0,
                color: checker ? Colors.white : Colors.black,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

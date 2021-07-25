import 'package:aview2/helper/helper_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  ScrollController secondScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      secondScrollController.animateTo(
        secondScrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    });

    // getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('️Chat'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('chat').orderBy('time').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: secondScrollController,
                    itemBuilder: (context, index) {
                      final docs = snapshot.data!.docs[index];
                      return MessageBubble(
                        sender: docs['sender'],
                        text: docs['text'],
                        time: docs['time'] as Timestamp,
                        isMe:
                            docs['sender'] == 'sara' ? true : false,
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      decoration:
                          kRoundedDecorationTF.copyWith(hintText: 'message...'),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (messageTextController.text.length > 0) {
                        await FirebaseFirestore.instance
                            .collection('chat')
                            .add({
                          'text': messageTextController.text,
                          //    'sender': FirebaseAuth.instance.currentUser!.email,
                          'sender': 'sara',
                          "time": DateTime.now()
                        });
                        messageTextController.clear();
                        secondScrollController.animateTo(
                          secondScrollController.position.maxScrollExtent +
                              1000,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.fastOutSlowIn,
                        );
                      } else {
                        Fluttertoast.showToast(msg: 'enter message');
                      }
                    },
                    child: Text(
                      'Send',
                      style: Theme.of(context).textTheme.headline1,
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

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  final Timestamp time; // add this

  const MessageBubble({
    required this.text,
    required this.sender,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ' $sender ',
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
            color: isMe ? Colors.deepOrange : Colors.grey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Text(
            ' ${DateTime.fromMillisecondsSinceEpoch(time.seconds * 10000)}',
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

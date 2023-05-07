import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/core/constants/firebaseconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/chatconstants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String messageText;
  TextEditingController ctr = TextEditingController();

  // void getMessages() async {
  //   final messages = await firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }
  void messagesStream() async {
    await for (var snapshot in firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: CustomAppBar(
          height: getVerticalSize(56.00),
          leadingWidth: 52,
          centerTitle: true,
          title: AppbarTitle(text: "Discussion Portal")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection('messages')
                    .orderBy("time", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data?.docs;
                    List<MessageBubble> messageBubbles = [];
                    for (var message in messages!) {
                      String? messageText = message['text'];
                      String? messageSender = message['sender'];
                      DateTime? msgtime =
                          (message['time'] as Timestamp).toDate();
                      MessageBubble messageBubble = MessageBubble(
                        sender: messageSender,
                        text: messageText,
                      );
                      messageBubbles.add(messageBubble);
                    }

                    return Expanded(
                        child: ListView(
                            reverse: true,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            children: messageBubbles));
                  }
                  return CircularProgressIndicator();
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: ctr,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                    child: CustomButton(
                        onTap: () {
                          ctr.clear();
                          firestore.collection('messages').add({
                            'text': messageText,
                            'sender': firebaseAuth.currentUser?.email,
                            'time': DateTime.now(),
                          });
                        },
                        height: 51,
                        width: 80,
                        text: "Send",
                        margin: getMargin(top: 3, bottom: 2),
                        variant: ButtonVariant.FillCyan600),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ctr.clear();
                  //     firestore.collection('messages').add({
                  //       'text': messageText,
                  //       'sender': firebaseAuth.currentUser?.email,
                  //     });
                  //   },
                  //   child: Text(
                  //     'Send',
                  //     style: kSendButtonTextStyle,
                  //   ),
                  // ),
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
  MessageBubble({this.sender, this.text});
  String? sender;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: (firebaseAuth.currentUser?.email == sender)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$sender ",
              style: TextStyle(fontSize: 10.0, color: Colors.white),
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: (firebaseAuth.currentUser?.email == sender)
                    ? Radius.circular(0)
                    : Radius.circular(20),
                topRight: (firebaseAuth.currentUser?.email == sender)
                    ? Radius.circular(30)
                    : Radius.circular(00),
                bottomRight: (firebaseAuth.currentUser?.email == sender)
                    ? Radius.circular(20)
                    : Radius.circular(20)),
            color: (firebaseAuth.currentUser?.email == sender)
                ? ColorConstant.cyan60001
                : ColorConstant.gray100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "$text ",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

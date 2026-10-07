import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    final notificationSettings = await fcm.requestPermission();
    fcm.subscribeToTopic('chat'); 

// Push notifications need the address to target a device, so we get the token
    final token = await fcm.getToken(); //
    print(
        token); // you can send this token to backend and do some message campaigns on it
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FlutterChat"),
          actions: [
            IconButton(
              onPressed: () {
                _firebase.signOut();
              },
              icon: Icon(Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
        body: const Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessage(),
          ],
        ));
  }
}

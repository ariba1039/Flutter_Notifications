import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  String title = 'TRIGGER ';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //this will check if the user has allowed notifications or
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        /// IF it is false then this function will be called to request permission
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    super.initState();
  }
//If title and body is not specify than the notification act like a silent notification
//(which is not  show on status bar but is recived inside app listeners )
//Basic Notification,Big picture notification,

  triggerNotifications() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'SIMPLE NOTIFICATION',
          body: 'This is a simple notification',
          bigPicture:
              'https://images.unsplash.com/photo-1682685796063-d2604827f7b3?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          notificationLayout: NotificationLayout.BigPicture),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: triggerNotifications,
          child: const Text('Trigger Notifications'),
        ),
      ),
    );
  }
}

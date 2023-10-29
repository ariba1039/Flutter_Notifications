import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification_course/Screens/home_screen.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'basic notifications',
        channelDescription: 'Notification channel for basic tests',
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Secret,   
        defaultColor: Colors.amberAccent,
        enableVibration: true,
        //defaultRingtoneType:DefaultRingtoneType.Ringtone,

         ),
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Mastering Flutter Notification Course',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

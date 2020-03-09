import 'package:flutter/material.dart';
import 'package:push_flutter/Notifications/ui/screens/home.dart';
import 'package:push_flutter/Notifications/ui/screens/notification.dart';
import 'package:push_flutter/providers/push_notifications_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final pushProvider = new AppPushProvider();
    pushProvider.initNotifications();
    pushProvider.mensajes.listen((argumento){
      //Navigator.push(context, route)
      navigatorKey.currentState.pushNamed('noti', arguments: argumento);
      print("Listener");
      print(argumento);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Push Notification',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'noti' : (BuildContext context) => NotiPage(),
      },
    );
  }
}
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class AppPushProvider{
  
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications(){
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){
      print("----- FCM Token -----");
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (info) {
        print('----- onMessage -----');
        String argumento = "no-data";
        if(Platform.isAndroid){
          argumento = info["data"]['objeto'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
      onLaunch: (info) {
        print('----- onLaunch -----');
        String argumento = "no-data";
        if(Platform.isAndroid){
          argumento = info["data"]['objeto'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
      onResume: (info) {
        print('----- onResume -----');
        String argumento = "no-data";
        if(Platform.isAndroid){
          argumento = info["data"]['objeto'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      }
    );

  }
  
  dispose(){
    _mensajesStreamController?.close();
  }

}
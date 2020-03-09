import 'package:flutter/material.dart';

class NotiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Page'),
      ),
      body: Center(
        child: Container(
          child: Text(args),
        ),
      ),
    );
  }
}
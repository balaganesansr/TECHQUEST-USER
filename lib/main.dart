import 'dart:io';
import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:MZQUIZARDRY/pages/instructions.dart';
import 'package:flutter/material.dart';
import 'package:MZQUIZARDRY/pages/homepage.dart';
import 'package:MZQUIZARDRY/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TECHQUEST-23',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      exit(0);
    }
  }
}

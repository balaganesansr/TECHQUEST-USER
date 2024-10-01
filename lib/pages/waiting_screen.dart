import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/pages/homepage.dart';

class wait extends StatefulWidget {
  final content;
  const wait({super.key, this.content});

  @override
  State<wait> createState() => _waitState();
}

class _waitState extends State<wait> {
  late Timer _timer;
  final StreamController _streamController = StreamController();

  @override
  void initState() {
    enter
        ? {
            _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
              setState(() {
                get_status();
              });
            })
          }
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              if (status.length != 0 || true) {
                if (/*status[status.length - 1]["status"] == 1 ||*/ true) {
                  _timer.cancel();
                  _streamController.close();
                  return homepage();
                } else {
                  return Center(
                    child: Text(widget.content,
                        style:
                            GoogleFonts.aleo(color: Colors.red, fontSize: 24)),
                  );
                }
              }
              return Center(
                child: Text(widget.content,
                    style: GoogleFonts.aleo(color: Colors.red, fontSize: 18)),
              );
            }));
  }
}

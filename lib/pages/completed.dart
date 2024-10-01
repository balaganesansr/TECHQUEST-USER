import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class completed extends StatefulWidget {
  const completed({super.key});

  @override
  State<completed> createState() => _completedState();
}

class _completedState extends State<completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Succesfully Completed !",
              style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w500))),
    );
  }
}

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MZQUIZARDRY/constants.dart';

var appbar = AppBar(
    backgroundColor: Color.fromARGB(255, 255, 0, 0).withOpacity(0.6),
    actions: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: CircularCountDownTimer(
          textStyle: GoogleFonts.poppins(color: Color.fromARGB(255, 0, 0, 0)),
          duration: 30,
          strokeWidth: 5,
          isReverse: false,
          isReverseAnimation: false,
          width: 50,
          height: 50,
          onComplete: () {
            print("Countdown Complete!");
          },
          fillColor: Colors.red,
          ringColor: Color.fromARGB(255, 123, 28, 28),
        ),
      ),
    ],
    title: Text(
      "MIND MAZE",
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0)),
    ));

class option extends StatelessWidget {
  final options, bordercolor;
  Color bgcolor;
  option({super.key, this.options, this.bordercolor, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width(context) * 0.7,
        decoration: BoxDecoration(
          border: Border.all(color: bordercolor, width: 2),
          color: bgcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(options,
              style: GoogleFonts.readexPro(fontSize: 16, color: Colors.white)),
        ));
  }
}

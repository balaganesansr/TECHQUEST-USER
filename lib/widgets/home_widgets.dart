import 'package:MZQUIZARDRY/pages/start.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/pages/mcq.dart';
import '../pages/instructions.dart';
import '../pages/picture.dart';
import '../pages/rapid.dart';

var appbar = AppBar(
    backgroundColor: Color.fromARGB(255, 163, 11, 0),
    centerTitle: true,
    title: Text(
      "MZCET TECHQUEST ' - 23",
      style: GoogleFonts.poppins(color: Colors.white),
    ));

class rounds extends StatelessWidget {
  rounds({this.round, this.img, this.bordercolor, this.font_color});
  final round, img, bordercolor, font_color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 8,
        right: 8,
        bottom: 12.0,
      ),
      child: GestureDetector(
        onTap: () {
          if (round == "MIND MAZE") {
            page = 0;
            currentround == "R1"
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => instructions()),
                    (Route<dynamic> route) => false,
                  )
                : null;
          } else if (round == "MINDSPARK PARADOX") {
            print("picture");
            page = 1;
            currentround == "R2"
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => instructions()),
                    (Route<dynamic> route) => false,
                  )
                : null;
          } else if (round == "RAPID FIRE") {
            page = 2;
            currentround == "R3"
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => instructions()),
                    (Route<dynamic> route) => false,
                  )
                : null;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: bordercolor, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5.0, bottom: 5, left: 12, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: height(context) / 16,
                    width: width(context) / 16,
                    child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 234, 234, 234),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            backgroundImage: AssetImage(img)))),
                Text(
                  round,
                  style: GoogleFonts.readexPro(fontSize: 15, color: font_color),
                ),
                Icon(Icons.arrow_forward_ios_outlined,
                    size: 18, color: Colors.grey)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

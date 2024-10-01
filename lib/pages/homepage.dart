import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/widgets/home_widgets.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      //appBar: appbar,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(children: [
            Container(
              height: height(context),
              width: width(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                    "https://i.pinimg.com/564x/1b/7f/6c/1b7f6ca16b06e94898775594a78b61a1.jpg",
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height(context) / 3,
                  width: width(context) / 3,
                  child: Image.asset(homeImg, fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    header,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 95, 84),
                        fontSize: width(context) * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  header1,
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 165, 238, 248),
                      fontSize: width(context) * 0.025,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      rounds(
                        round: "MIND MAZE",
                        img: mcqImg,
                        bordercolor: Colors.blueGrey,
                        font_color: Colors.black,
                      ),
                      rounds(
                          round: "MINDSPARK PARADOX",
                          img: picImg,
                          bordercolor: Colors.blueGrey,
                          font_color: Colors.black),
                      rounds(
                          round: "RAPID FIRE",
                          img: rapidImg,
                          bordercolor: Colors.blueGrey,
                          font_color: Colors.black),
                      rounds(
                          round: "INSTRUCTIONS",
                          img: insImg,
                          bordercolor: Colors.blueGrey,
                          font_color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}

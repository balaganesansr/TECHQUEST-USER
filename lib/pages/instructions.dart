import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/pages/mcq.dart';
import 'package:MZQUIZARDRY/pages/picture.dart';
import 'package:MZQUIZARDRY/pages/rapid.dart';
import 'package:MZQUIZARDRY/widgets/home_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class instructions extends StatefulWidget {
  const instructions({super.key});

  @override
  State<instructions> createState() => _instructionsState();
}

class _instructionsState extends State<instructions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
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
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text("INSTRUCTIONS",
                          style: GoogleFonts.inter(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 10),
                      Text(roundss[page],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 15),
                      ListView.builder(
                          padding: EdgeInsets.all(8),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: headers[page].length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      Text("✩ " + headers[page][index],
                                          style: GoogleFonts.ptSans(
                                              color:
                                                  Color.fromRGBO(89, 89, 89, 1),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0, top: 3),
                                      child: Container(
                                        width: 320,
                                        child: Text(contents[page][index],
                                            style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                      SizedBox(height: 30),
                      MaterialButton(
                          onPressed: () {
                            if (page == 0) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mcqRound(count: 0)),
                                (Route<dynamic> route) => false,
                              );
                            } else if (page == 1) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        pictureRound(count: 0)),
                                (Route<dynamic> route) => false,
                              );
                            } else if (page == 2) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => rapidRound(count: 0)),
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text("Let's Start",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 18)),
                          )),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              page == 0
                  ? Visibility(
                      visible: false,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/mapview-aafa3.appspot.com/o/BG.jpg?alt=media&token=f9b13d09-0ef3-49bf-ac0d-9b25c8d9ed0d",
                      ))
                  : Container(),
              page == 1
                  ? Visibility(
                      visible: false,
                      child: ListView.builder(
                        itemCount: round2.length,
                        itemBuilder: (context, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: round2[i]['PICTURE_COUNT'],
                                itemBuilder: (context, index) {
                                  return CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    imageUrl: round2[i]["PICTURE_${index + 1}"],
                                  );
                                },
                              ),
                              Center(
                                child: MaterialButton(
                                    onPressed: () {},
                                    child: Text("click"),
                                    color: Colors.red),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }
}

import 'dart:ui';
import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:MZQUIZARDRY/pages/completed.dart';
import 'package:MZQUIZARDRY/pages/waiting_screen.dart';
import 'package:MZQUIZARDRY/widgets/home_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MZQUIZARDRY/constants.dart';

class pictureRound extends StatefulWidget {
  final count;

  const pictureRound({super.key, required this.count});

  @override
  State<pictureRound> createState() => _pictureRoundState();
}

class _pictureRoundState extends State<pictureRound> {
  List<bool> cellStates = List.generate(20, (index) => true);
  List ans = [];
  bool fourImg = true;
  bool wait = true;
  CountDownController duration = CountDownController();
  @override
  void initState() {
    widget.count == 0
        ? get_r2_question().whenComplete(() {
            gridOutput(round2[widget.count]['ANSWER']).whenComplete(() {
              round2[widget.count]['PICTURE_COUNT'] == 4
                  ? fourImg = true
                  : fourImg = false;
              wait = false;
              setState(() {});
            });
          })
        : {
            wait = false,
            gridOutput(round2[widget.count]['ANSWER']).whenComplete(() {
              round2[widget.count]['PICTURE_COUNT'] == 4
                  ? fourImg = true
                  : fourImg = false;
              setState(() {});
            })
          };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: wait
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Container(
                    child: Image.asset('Assets/BG.jpg', fit: BoxFit.cover),
                    height: height(context),
                    width: width(context),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: height(context) * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              imgCon(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: imageWidget(
                                      image: round2[widget.count]["PICTURE_1"]),
                                ),
                              ),
                              imgCon(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: imageWidget(
                                      image: round2[widget.count]["PICTURE_2"]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height(context) * 0.02),
                          Center(
                            child: Row(
                              mainAxisAlignment:
                                  round2[widget.count]['PICTURE_COUNT'] == 4
                                      ? MainAxisAlignment.spaceBetween
                                      : MainAxisAlignment.center,
                              children: [
                                imgCon(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: imageWidget(
                                        image: round2[widget.count]
                                            ["PICTURE_3"]),
                                  ),
                                ),
                                Visibility(
                                  visible: fourImg,
                                  child: imgCon(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: imageWidget(
                                          image: round2[widget.count]
                                              ["PICTURE_4"]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height(context) * 0.04),
                          CircularCountDownTimer(
                            controller: duration,
                            textStyle: GoogleFonts.graduate(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25),
                            duration: 40,
                            strokeWidth: 4,
                            isReverse: false,
                            isReverseAnimation: false,
                            width: 70,
                            height: 70,
                            onComplete: () {
                              if (widget.count < round2.length - 1) {
                                r2_score = "0";
                                r2_question_id =
                                    round2[widget.count]["QUESTION_ID"];
                                r2_time = "30";
                                R2_performance().whenComplete(() {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => pictureRound(
                                                count: widget.count + 1,
                                              ))),
                                      (route) => false);
                                });
                              } else {
                                r2_score = "0";
                                r2_question_id =
                                    round2[widget.count]["QUESTION_ID"];
                                r2_time = "30";
                                R2_performance().whenComplete(() {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => completed())),
                                      (route) => false);
                                });
                              }
                            },
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            ringColor: const Color.fromARGB(255, 222, 222, 222),
                          ),
                          SizedBox(height: height(context) * 0.03),
                          SizedBox(
                            width: width(context),
                            height: 40,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: ans.length,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Center(
                                      child: Text(
                                        ans[index][0].toString(),
                                        style: GoogleFonts.aleo(
                                          color: Colors.white,
                                          fontSize: 23,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                          ),
                          SizedBox(height: height(context) * 0.03),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2, color: Colors.white)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 0.6,
                                    mainAxisSpacing: 0.2,
                                  ),
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (text[index] == "⌫") {
                                                cellStates[ans[ans.length - 1]
                                                    [1]] = true;
                                                ans.removeLast();
                                              } else {
                                                if (cellStates[index] == true) {
                                                  cellStates[index] = false;
                                                  ans.add([text[index], index]);
                                                  user_ans = "";
                                                  for (var i in ans) {
                                                    user_ans += i[0].toString();
                                                  }
                                                  if (user_ans ==
                                                      round2[widget.count]
                                                          ["ANSWER"]) {
                                                    if (widget.count <
                                                        round2.length - 1) {
                                                      r2_score = "10";
                                                      r2_question_id =
                                                          round2[widget.count]
                                                              ["QUESTION_ID"];
                                                      r2_time = duration
                                                          .getTime()
                                                          .toString();
                                                      R2_performance()
                                                          .whenComplete(() {
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        ((context) =>
                                                                            pictureRound(
                                                                              count: widget.count + 1,
                                                                            ))),
                                                                (route) =>
                                                                    false);
                                                      });
                                                    } else {
                                                      r2_score = "10";
                                                      r2_question_id =
                                                          round2[widget.count]
                                                              ["QUESTION_ID"];
                                                      r2_time = duration
                                                          .getTime()
                                                          .toString();
                                                      R2_performance()
                                                          .whenComplete(() {
                                                        Navigator.pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    ((context) =>
                                                                        completed())),
                                                            (route) => false);
                                                      });
                                                    }
                                                  }
                                                }
                                              }
                                            });
                                          },
                                          child: LetterContainer(
                                              index: index,
                                              outlineColor: Colors.white,
                                              backgroundColor: cellStates[index]
                                                  ? Colors.black
                                                      .withOpacity(0.8)
                                                  : Colors.pink
                                                      .withOpacity(0.8),
                                              textcolor: Colors.white)),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class imgCon extends StatelessWidget {
  const imgCon({Key? key, required this.child, required}) : super(key: key);

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height(context) * 0.18,
        width: width(context) * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 3.1, color: Colors.white),
          color: Colors.white,
        ),
        child: child);
  }
}

class LetterContainer extends StatelessWidget {
  final Color outlineColor;
  final Color backgroundColor;
  final Color textcolor;

  final int index;

  LetterContainer(
      {required this.outlineColor,
      required this.backgroundColor,
      required this.index,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2.3,
          color: outlineColor,
        ),
      ),
      child: Center(
        child: Text(
          text[index],
          style: GoogleFonts.poppins(
              color: textcolor, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class imageWidget extends StatelessWidget {
  const imageWidget({this.image});
  final image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover));
  }
}

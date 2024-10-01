import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/pages/completed.dart';
import '../widgets/mcq_widgets.dart';

class mcqRound extends StatefulWidget {
  mcqRound({required this.count});
  final count;
  @override
  State<mcqRound> createState() => _mcqRoundState();
}

class _mcqRoundState extends State<mcqRound> {
  CountDownController duration = CountDownController();
  bool a = false, b = false, c = false, d = false;
  bool wait = true;
  @override
  void initState() {
    widget.count == 0
        ? get_r1_question().whenComplete(() {
            wait = false;
            setState(() {});
          })
        : {
            wait = false,
            r1_answer = "NO",
          };
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            body: wait
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.red,
                  ))
                : Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl:
                              "https://firebasestorage.googleapis.com/v0/b/mapview-aafa3.appspot.com/o/BG.jpg?alt=media&token=f9b13d09-0ef3-49bf-ac0d-9b25c8d9ed0d",
                          width: width(context),
                          height: height(context),
                          fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1.0)),
                                  height: height(context) * 0.22,
                                  width: width(context) * 0.5,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(3),
                                      child: Image.network(
                                        round1[widget.count]['PICTURE'],
                                        fit: BoxFit.fill,
                                      ))),
                              const SizedBox(height: 30),
                              CircularCountDownTimer(
                                controller: duration,
                                textStyle: GoogleFonts.graduate(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 25),
                                duration: 30,
                                strokeWidth: 6,
                                isReverse: false,
                                isReverseAnimation: false,
                                width: 80,
                                height: 80,
                                onComplete: () {
                                  print("Countdown Complete!");
                                  if (widget.count < round1.length - 1) {
                                    if (round1[widget.count]["ANSWER"] ==
                                        r1_answer) {
                                      r1_score = 10;
                                    } else {
                                      r1_score = 0;
                                    }
                                    r1_time = "30";
                                    r1_question_id =
                                        round1[widget.count]["QUESTION_NO"];
                                    R1_performance().whenComplete(() {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => mcqRound(
                                                  count: widget.count + 1))),
                                          (route) => false);
                                    });
                                  } else {
                                    if (round1[widget.count]["ANSWER"] ==
                                        r1_answer) {
                                      r1_score = 10;
                                    } else {
                                      r1_score = 0;
                                    }
                                    r1_question_id =
                                        round1[widget.count]["QUESTION_NO"];
                                    r1_time = "30";
                                    R1_performance().whenComplete(() {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  completed())),
                                          (route) => false);
                                    });
                                  }
                                },
                                fillColor: Color.fromARGB(255, 249, 0, 0),
                                ringColor: Color.fromARGB(255, 222, 222, 222),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                round1[widget.count]["QUESTION"],
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: (() {
                                  r1_answer = "A";
                                  setState(() {
                                    a = true;
                                    b = false;
                                    c = false;
                                    d = false;
                                  });
                                }),
                                child: option(
                                  options: round1[widget.count]["OPTION_1"],
                                  bordercolor:
                                      a ? Colors.pinkAccent : Colors.tealAccent,
                                  bgcolor: a
                                      ? Colors.pink.withOpacity(0.4)
                                      : Colors.teal.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: (() {
                                  r1_answer = "B";
                                  setState(() {
                                    a = false;
                                    b = true;
                                    c = false;
                                    d = false;
                                  });
                                }),
                                child: option(
                                  options: round1[widget.count]["OPTION_2"],
                                  bordercolor:
                                      b ? Colors.pinkAccent : Colors.tealAccent,
                                  bgcolor: b
                                      ? Colors.pink.withOpacity(0.4)
                                      : Colors.teal.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: (() {
                                  r1_answer = "C";
                                  setState(() {
                                    a = false;
                                    b = false;
                                    c = true;
                                    d = false;
                                  });
                                }),
                                child: option(
                                  options: round1[widget.count]["OPTION_3"],
                                  bordercolor:
                                      c ? Colors.pinkAccent : Colors.tealAccent,
                                  bgcolor: c
                                      ? Colors.pink.withOpacity(0.4)
                                      : Colors.teal.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: (() {
                                  r1_answer = "D";
                                  setState(() {
                                    a = false;
                                    b = false;
                                    c = false;
                                    d = true;
                                  });
                                }),
                                child: option(
                                  options: round1[widget.count]["OPTION_4"],
                                  bordercolor:
                                      d ? Colors.pinkAccent : Colors.tealAccent,
                                  bgcolor: d
                                      ? Colors.pink.withOpacity(0.4)
                                      : Colors.teal.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                      color: Color.fromARGB(255, 0, 134, 0)
                                          .withOpacity(0.8),
                                      onPressed: () {
                                        if (r1_answer != "NO") {
                                          if (widget.count <=
                                              round1.length - 1) {
                                            r1_time = duration.getTime();
                                            r1_question_id =
                                                round1[widget.count]
                                                    ["QUESTION_NO"];
                                            if (round1[widget.count]
                                                    ["ANSWER"] ==
                                                r1_answer) {
                                              r1_score = 10;
                                            } else {
                                              r1_score = 0;
                                            }

                                            R1_performance().whenComplete(() {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          mcqRound(
                                                              count:
                                                                  widget.count +
                                                                      1))),
                                                  (route) => false);
                                            });
                                          } else {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        completed())),
                                                (route) => false);
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Next ",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 13)),
                                          Icon(Icons.arrow_forward_ios_sharp,
                                              color: Colors.white, size: 12)
                                        ],
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
  }
}

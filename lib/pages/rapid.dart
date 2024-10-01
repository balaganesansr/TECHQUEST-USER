import 'dart:async';
import 'dart:math';

import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:MZQUIZARDRY/constants.dart';
import '../widgets/mcq_widgets.dart';

class rapidRound extends StatefulWidget {
  @override
  final count;
  const rapidRound({required this.count});
  State<rapidRound> createState() => _rapidRoundState();
}

class _rapidRoundState extends State<rapidRound> {
  ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));
  bool a = false, b = false, c = false, d = false;
  bool buzzer = false;
  bool buzzerclick = true;
  bool wait = true;
  bool valid = false;
  bool answered = false;
  bool correct = false;
  int no = 0;
  @override
  late Timer _timer;
  final StreamController _streamController = StreamController();

  @override
  void initState() {
    get_r3_question().whenComplete(() {
      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        getquestionNo().whenComplete(() {
          setState(() {
            if (no != int.parse(Qno[0]['question_no']) - 1) {
              setState(() {
                buzzer = false;
                buzzerclick = true;
                a = false;
                b = false;
                c = false;
                d = false;
                correct = false;
                answered = false;
                valid = false;
                _confettiController.stop();
              });
            }
            no = int.parse(Qno[0]['question_no']) - 1;
          });
          get_r3status(no + 1).whenComplete(() {
            if (statusr3.length != 0) {
              if (statusr3[0]['status'] == "1") {
                setState(() {
                  valid = true;
                  performance_id = statusr3[0]['id'];
                });
              }
            }
          });
          get_r3(no + 1).whenComplete(() {
            wait = false;
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: wait
              ? Center(child: CircularProgressIndicator(color: Colors.red))
              : Stack(
                  children: [
                    Image.asset(bgimg_Mcq,
                        width: width(context),
                        height: height(context),
                        fit: BoxFit.cover),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text("Team List's",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 10),
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.white, width: 1.0)),
                                height: height(context) * 0.212,
                                width: width(context) * 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ListView.builder(
                                      itemCount: teamsr3.length,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          child: Container(
                                              height: 40,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: index % 2 == 0
                                                      ? Color.fromARGB(
                                                              255, 255, 255, 255)
                                                          .withOpacity(0.2)
                                                      : Color.fromARGB(
                                                              255, 0, 0, 0)
                                                          .withOpacity(0.2),
                                                  border: Border.all(
                                                      color: index % 2 == 0
                                                          ? Color.fromARGB(
                                                              255, 255, 255, 255)
                                                          : Color.fromARGB(255,
                                                              255, 255, 255),
                                                      width: 2)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        teamsr3[index]
                                                                ['teamname']
                                                            .toString()
                                                            .split("_")[0],
                                                        style: GoogleFonts.aleo(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                ),
                                              )),
                                        );
                                      })),
                                )),
                            const SizedBox(height: 30),
                            //sens
                            Text(
                              round3[no]['QUESTION'],
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: (() {
                                if (valid == true && answered == false) {
                                  setState(() {
                                    a = true;
                                    answered = true;
                                    if (round3[no]['ANSWER'] == "A") {
                                      print("correct");
                                      correctanswer();
                                      _confettiController.play();
                                    } else {
                                      print("Wrong");
                                      wrongAnswer();
                                    }
                                  });
                                }
                              }),
                              child: statusr3[0]['status'] == null ||
                                      statusr3[0]['status'] == "0"
                                  ? option(
                                      options: round3[no]["OPTION_1"],
                                      bordercolor: Colors.white,
                                      bgcolor: Colors.black.withOpacity(0.4))
                                  : option(
                                      options: round3[no]["OPTION_1"],
                                      bordercolor: a
                                          ? Colors.pinkAccent
                                          : Colors.tealAccent,
                                      bgcolor: a
                                          ? Colors.pink.withOpacity(0.4)
                                          : Colors.teal.withOpacity(0.4),
                                    ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: (() {
                                if (valid == true && answered == false) {
                                  setState(() {
                                    b = true;
                                    answered = true;
                                    if (round3[no]['ANSWER'] == "B") {
                                      print("correct");

                                      correctanswer();
                                      _confettiController.play();
                                    } else {
                                      print("Wrong");
                                      wrongAnswer();
                                    }
                                  });
                                }
                              }),
                              child: statusr3[0]['status'] == null ||
                                      statusr3[0]['status'] == "0"
                                  ? option(
                                      options: round3[1]["OPTION_2"],
                                      bordercolor: Colors.white,
                                      bgcolor: Colors.black.withOpacity(0.4))
                                  : option(
                                      options: round3[1]["OPTION_2"],
                                      bordercolor: b
                                          ? Colors.pinkAccent
                                          : Colors.tealAccent,
                                      bgcolor: b
                                          ? Colors.pink.withOpacity(0.4)
                                          : Colors.teal.withOpacity(0.4),
                                    ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: (() {
                                if (valid == true && answered == false) {
                                  setState(() {
                                    c = true;
                                    answered = true;
                                    if (round3[no]['ANSWER'] == "C") {
                                      print("correct");

                                      correctanswer();
                                      _confettiController.play();

                                      setState(() {
                                        correct = true;
                                      });
                                    } else {
                                      print("Wrong");
                                      wrongAnswer();
                                    }
                                  });
                                }
                              }),
                              child: statusr3[0]['status'] == null ||
                                      statusr3[0]['status'] == "0"
                                  ? option(
                                      options: round3[no]["OPTION_3"],
                                      bordercolor: Colors.white,
                                      bgcolor: Colors.black.withOpacity(0.4))
                                  : option(
                                      options: round3[no]["OPTION_3"],
                                      bordercolor: c
                                          ? Colors.pinkAccent
                                          : Colors.tealAccent,
                                      bgcolor: c
                                          ? Colors.pink.withOpacity(0.4)
                                          : Colors.teal.withOpacity(0.4),
                                    ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: (() {
                                if (valid == true && answered == false) {
                                  setState(() {
                                    d = true;
                                    answered = true;
                                    if (round3[no]['ANSWER'] == "D") {
                                      print("correct");
                                      correctanswer();
                                      _confettiController.play();
                                    } else {
                                      print("Wrong");
                                      wrongAnswer();
                                    }
                                  });
                                }
                              }),
                              child: statusr3[0]['status'] == null ||
                                      statusr3[0]['status'] == "0"
                                  ? option(
                                      options: round3[no]["OPTION_4"],
                                      bordercolor: Colors.white,
                                      bgcolor: Colors.black.withOpacity(0.4))
                                  : option(
                                      options: round3[no]["OPTION_4"],
                                      bordercolor: d
                                          ? Colors.pinkAccent
                                          : Colors.tealAccent,
                                      bgcolor: d
                                          ? Colors.pink.withOpacity(0.4)
                                          : Colors.teal.withOpacity(0.4),
                                    ),
                            ),
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(180),
                                      child: MaterialButton(
                                          color: buzzer
                                              ? Colors.red
                                              : Color.fromARGB(255, 0, 0, 0),
                                          onPressed: () {
                                            setState(() {
                                              buzzer = true;
                                            });
                                            if (buzzer == true) {
                                              if (buzzerclick == true) {
                                                print("enter");
                                                r3_question_id = no + 1;
                                                R3_performance()
                                                    .whenComplete(() {
                                                  buzzerclick = false;
                                                });
                                              }
                                            }
                                            // Navigator.pushAndRemoveUntil(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: ((context) =>
                                            //             rapidRound(count:no+1))),
                                            //     (route) => false);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text("BUZZER",
                                                style: GoogleFonts.aleo(
                                                    letterSpacing: 2.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 17)),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height(context),
                      width: width(context),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: ConfettiWidget(
                            blastDirectionality: BlastDirectionality.explosive,
                            confettiController: _confettiController,
                            blastDirection: -pi / 2,
                            shouldLoop: true,
                            numberOfParticles: 50,
                            maxBlastForce: 100,
                            gravity: 1,
                            colors: const [
                              Colors.red,
                              Colors.green,
                              Colors.blue
                            ],
                          )),
                    ),
                  ],
                )),
    );
  }
}

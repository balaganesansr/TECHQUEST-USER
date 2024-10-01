import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';

// HEIGHT WIDTH DECLARATIONS
height(con) => MediaQuery.of(con).size.height;
width(con) => MediaQuery.of(con).size.height;

//COLORS DECLARATIONS
Color bg_color = Colors.white;

// IMAGE DECLARATIONS
var homeImg = "Assets/home.jpg";
var mcqImg = "Assets/MCQ.png";
var picImg = "Assets/PIC.png";
var rapidImg = "Assets/RAPID.JPG";
var insImg = "Assets/INS.png";
var bgImg = "Assets/bgImg.json";
var quesImg = "Assets/QUESTION.jpg";
var bgimg_Mcq = "Assets/BG.jpg";
var team_name;

//CONTENTS DECLARATIONS
var header1 = "QUIZ EVENT";
var header = "MZCET TECHNICAL SYMPOSIYUM";

List<String> text = [];
List R = [];

Future gridOutput(input) async {
  text = [];
  final word = input;
  final numRows = 4;
  final numCols = 5;
  final totalCells = numRows * numCols - 1;
  final numRandomLetters = totalCells - word.length;
  final random = Random();
  final letters = List.generate(
      26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
  final randomLetters = List.generate(
      numRandomLetters.toInt(), (index) => letters[random.nextInt(26)]);
  final allLetters = (word.split('')..addAll(randomLetters))..shuffle();
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      if (i == numRows - 1 && j == numCols - 1) {
        text.add('⌫');
      } else {
        text.add(allLetters[i * numCols + j]);
      }
    }
  }
}

//List status = [];
List round1 = [];
List round2 = [];
List round3 = [];
List status = [];
List statusr3 = [];
List teamsr3 = [];
List Qno = [];
List scorer3 = [];
//
var r1_question_id;
var r1_score;
var r1_answer = "NO";
var r1_time;
var r2_question_id;
var r2_score;
var r2_answer = "NO";
var r2_time;
var r3_question_id;
var r3_score;
var currentround;
var performance_id;
bool enter = false;
String user_ans = "";
int page = 0;

List headers = [
  [
    "No.of Questions : 30",
    "Per question time: 30 seconds",
    "No external resources allowed",
    "No opening new tabs allowed"
  ],
  [
    "No.of Questions : 20",
    "Time per Questions: 40 seconds",
    "No External Assistance",
    "Focus on the Given Images Only"
  ],
  [
    "No. of Questions: 10",
    "Buzzer System in Play",
    "First Buzz, First Preference",
    "Incorrect Response Passes to Next",
    "No External Assistance"
  ]
];

List roundss = [
  "MCQ ROUND - MIND MAZE",
  "PICTURE ROUND - MINDSPARK PARADOX",
  "RAPID FIRE ROUND"
];

List contents = [
  [
    "In this round, there will be a total of 30 questions, each designed to challenge your knowledge across various subjects.",
    "You'll have a strict time limit of 30 seconds for each question. This requires quick thinking and a good grasp of the subject matter.",
    "Participants are prohibited from using any external sources such as books, internet searches, or notes. This round is designed to test your own knowledge.",
    "It's essential to rely solely on your own memory and understanding. Opening new browser tabs or using other applications is strictly prohibited during this round."
  ],
  [
    "This round features a total of 20 intriguing images that may challenge your perception and observation skills.",
    "You'll have 40 seconds to carefully examine each picture and provide your answer. Attention to detail is key!",
    "Participants are not permitted to seek help from external sources or consult with others.",
    "Ensure you concentrate solely on the provided pictures. Referencing additional images or resources is strictly prohibited.",
  ],
  [
    "The Rapid Fire Round comprises 10 quick-fire questions designed to test your immediate recall and quick thinking abilities.",
    "Participants will have access to a buzzer system. The first person to buzz in gets the opportunity to answer.",
    "The first participant to hit the buzzer will have the chance to respond.",
    "If a participant provides an incorrect answer, the opportunity to answer will pass to the next person who buzzes in. They'll have a chance to respond.",
    "Participants are not permitted to seek help from external sources or consult with others."
  ]
];

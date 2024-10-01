import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:MZQUIZARDRY/constants.dart';

String api = "https://mzcet.in/techquest24/QuizApi/user";
List<dynamic> data = [];

Future register() async {
  final response = await http.post(
    Uri.parse('$api/login.php'),
    body: ({"teamname": team_name.toString().toUpperCase()}),
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return response.body;
  }
}

Future get_status() async {
  final response = await http.post(
    Uri.parse('$api/loginstatus.php'),
    body: ({"teamname": team_name}),
  );
  if (response.statusCode == 200) {
    status = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future get_r1_question() async {
  final response = await http.get(
    Uri.parse('$api/round1.php'),
  );
  if (response.statusCode == 200) {
    round1 = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future get_r2_question() async {
  final response = await http.get(
    Uri.parse('$api/round2.php'),
  );
  if (response.statusCode == 200) {
    round2 = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future get_r3_question() async {
  final response = await http.get(
    Uri.parse('$api/round3.php'),
  );
  if (response.statusCode == 200) {
    round3 = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future R1_performance() async {
  final response = await http.post(
    Uri.parse('$api/Performance.php'),
    body: json.encode({
      "teamname": team_name,
      "question_id": r1_question_id,
      "score": r1_score,
      "user_answer": r1_answer,
      "time": r1_time.toString()
    }),
  );
  if (response.statusCode == 200) {
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future R2_performance() async {
  final response = await http.post(
    Uri.parse('$api/Performance2.php'),
    body: json.encode({
      "teamname": team_name,
      "question_id": r2_question_id,
      "score": r2_score,
      "time": r2_time.toString()
    }),
  );
  if (response.statusCode == 200) {
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future R3_performance() async {
  final response = await http.post(
    Uri.parse('$api/Performance3.php'),
    body: json.encode({
      "teamname": team_name,
      "question_id": r3_question_id,
      "score": 0,
      "time": "1.00"
    }),
  );
  if (response.statusCode == 200) {
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future get_r3(question_id) async {
  final response = await http.post(
    Uri.parse('$api/getr3.php'),
    body: ({"question_id": question_id.toString()}),
  );
  if (response.statusCode == 200) {
    teamsr3 = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future get_r3status(question_id) async {
  final response = await http.post(
    Uri.parse('$api/r3status.php'),
    body: ({"question_id": question_id.toString(), "teamname": team_name}),
  );
  if (response.statusCode == 200) {
    statusr3 = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future<void> wrongAnswer() async {
  try {
    final response = await http.post(
      Uri.parse('$api/updatestatus.php'),
      body: ({"id": (performance_id + 1).toString()}),
    );
    if (response.statusCode == 200) {
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> correctanswer() async {
  try {
    final response = await http.post(
      Uri.parse('$api/updatescore.php'),
      body: ({"id": performance_id.toString()}),
    );
    if (response.statusCode == 200) {
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future getquestionNo() async {
  final response = await http.get(
    Uri.parse('$api/getquestion.php'),
  );
  if (response.statusCode == 200) {
    Qno = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future getr3Scoreboard() async {
  final response = await http.get(
    Uri.parse('$api/Scorer3.php'),
  );
  if (response.statusCode == 200) {
    scorer3 = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future getround() async {
  final response = await http.get(
    Uri.parse('$api/getRound.php'),
  );
  if (response.statusCode == 200) {
    R = json.decode(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

Future<void> tests() async {
  final response = await http.get(
    Uri.parse('$api/test'),
  );
  if (response.statusCode == 200) {
    data = json.decode(response.body);
  }
}

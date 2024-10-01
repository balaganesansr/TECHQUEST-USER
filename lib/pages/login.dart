import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/pages/homepage.dart';
import 'package:MZQUIZARDRY/pages/waiting_screen.dart';
import 'package:MZQUIZARDRY/widgets/home_widgets.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    getround().whenComplete(() {
      currentround = R[0]['rounds'];
    });
    super.initState();
  }

  final teamNameController = TextEditingController();
  bool click = false;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height(context) * 0.05),
                  SizedBox(
                    height: 250,
                    child: Image.asset("Assets/mzcet.png"),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  Text(
                    "MZCET TECHQUEST - 2023",
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 95, 84),
                        fontSize: width(context) * 0.028,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: height(context) * 0.02),
                  Text(
                    "LOGIN",
                    style: GoogleFonts.actor(
                        color: Color.fromARGB(218, 0, 10, 155),
                        fontSize: width(context) * 0.028,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: height(context) * 0.035),
                  Container(
                    height: height(context) * 0.06,
                    width: width(context) * 0.8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 233, 233, 233),
                            blurRadius: 8)
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: teamNameController,
                      onFieldSubmitted: (value) async {
                        if (value.toString().trim() != "") {
                          team_name = value + "_" + currentround;
                          var status = await register();
                          if (status == "Insert successful") {
                            enter = true;
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => wait(
                                          content:
                                              "Please Wait for confirmation.....",
                                        ))),
                                (route) => false);
                          } else {
                            enter = false;

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => wait(
                                        content:
                                            "The Teamname has already logged in"))),
                                (route) => false);
                          }
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_pin,
                          color: Colors.red,
                        ),
                        hintText: 'Enter Your Team Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

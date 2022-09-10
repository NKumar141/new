import 'package:flutter/material.dart';
import 'package:myapp/otp.dart';
import 'package:myapp/phone.dart';
import '../src/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main2.dart';
import 'profile.dart';

class app5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffffff),
        accentColor: Colors.orange,
        primarySwatch: Colors.blue,
      ),
      home: Lang2(),
    );
  }
}

class Lang2 extends StatefulWidget {
  _Lang2State createState() => _Lang2State();
}

class _Lang2State extends State<Lang2> {
  String _email = '', _password = '';
  TextEditingController _controller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.asset(
                  'assets/images/Untitled2.png',
                  fit: BoxFit.fill,
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 10, 0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    "Click SignOut to get back",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 48,
                width: 320,
                child: ElevatedButton(
                    child: Text("Sign-Out", style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff465998)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side:
                                        BorderSide(color: Color(0xff465998))))),
                    onPressed: () {
                      auth.signOut();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => app3()));
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                    height: 42,
                    width: 185,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => sign()));
                      },
                      child: Text(
                        "New user SIGN-UP here",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}

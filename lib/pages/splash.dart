import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'onboard.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String email;
  late String username;

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  _startSplashScreen() async {
    await Future.delayed(Duration(seconds: 5));
    // _checkFirstRun();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool seenOnboard = prefs.getBool('seenOnboard') ?? false;
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userSnapshot =
          await _firestore.collection("users").doc(user!.uid).get();
      if (userSnapshot.exists) {
        setState(() {
          username = userSnapshot.get("username") ?? "";
          email = userSnapshot.get("email") ?? "";
        });
      }
      // Jika user sudah login, arahkan ke HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: RouteSettings(arguments: {
            'username': username,
            'email': email,
          }),
        ),
      );
    } else {
      // Arahkan ke OnboardScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardPage()),
      );
    }
  }

  // _checkFirstRun() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('isFirstRun', true);
  //   bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

  //   if (isFirstRun) {
  //     await prefs.setBool('isFirstRun', false);
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => OnboardPage()),
  //     );
  //   } else {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomePage()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffCFE9F8),
          image: DecorationImage(
            image: AssetImage('assets/bg2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/logo.png',
              scale: 7,
            ),
            Text(
              "TBC\nFree",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 41,
                color: Color(0xff354D5B),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Wait For Second",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff354D5B),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

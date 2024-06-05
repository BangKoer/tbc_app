import 'package:flutter/material.dart';
import 'package:tbc_app/pages/login.dart';
import 'package:tbc_app/pages/register.dart';

class OnboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffCFE9F8),
          image: DecorationImage(
            image: AssetImage('assets/bg2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 90),
            // Logo
            Image.asset(
              'assets/logo.png',
              scale: 6,
            ),
            SizedBox(height: 15),
            Text(
              "TBC\nFree",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 41,
                color: Color(0xff354D5B),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Say No To TBC!",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 23,
                color: Color(0xff6889AA),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffEDECEC),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 3,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontFamily: "Poppins-Bold",
                      fontSize: 23,
                      color: Color(0xff354D5B),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 240,
                    child: Text(
                      "Let's fight TBC and raise awareness of the importance of lung health.Thank you for your support!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins-Normal",
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Color(0xff354D5B),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff354D5B), width: 4.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              color: Color(0xff354D5B),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Color(0xff354D5B),
                            weight: 5.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff354D5B),
                            textStyle: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: 20,
                              color: Color(0xff354D5B),
                            ),
                            minimumSize: Size(120, 40),
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text("Login"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff354D5B),
                            textStyle: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: 20,
                              color: Color(0xff354D5B),
                            ),
                            minimumSize: Size(120, 40),
                            padding: EdgeInsets.symmetric(
                                horizontal: 45, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text("Register"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
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

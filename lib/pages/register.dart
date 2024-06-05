import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tbc_app/pages/home.dart';
import 'package:tbc_app/pages/login.dart';
import 'package:tbc_app/services/firebase_authController.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false;
  bool? ischeck = false;
  final _emailTextfieldcontroller = TextEditingController();
  final _usernameTextfieldcontroller = TextEditingController();
  final _passwordTextfieldcontroller = TextEditingController();
  final FirebaseAuthController _auth = FirebaseAuthController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextfieldcontroller.dispose();
    _passwordTextfieldcontroller.dispose();
    _usernameTextfieldcontroller.dispose();
    super.dispose();
  }

  void signup() async {
    String email = _emailTextfieldcontroller.text;
    String password = _passwordTextfieldcontroller.text;
    String username = _usernameTextfieldcontroller.text;

    User? user =
        await _auth.registerwithEmailandPassword(email, password, username);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Register Success!"),
        backgroundColor: Colors.green,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error Register! Try again"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff354D5B),
      resizeToAvoidBottomInset: false, // hindari resize saat keyboard muncul
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/logo.png",
              height: 50,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "TBC Free",
              style: TextStyle(
                fontFamily: "Poppins-Bold",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 20),
              // Image.asset(
              //   "assets/logo.png",
              //   height: 100,
              // ),
              // const SizedBox(height: 20),
              // Text(
              //   "Login",
              //   style: TextStyle(
              //     fontFamily: "Valorant",
              //     fontSize: 30,
              //     fontWeight: FontWeight.w700,
              //     color: Colors.white,
              //     letterSpacing: 1.5,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInputField('Enter your email', Icons.email,
                      _usernameTextfieldcontroller),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-Mail",
                    style: TextStyle(
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInputField('Enter your email', Icons.email,
                      _emailTextfieldcontroller),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildPasswordInputField(
                      'Enter your password', Icons.lock_person),
                ],
              ),
              const SizedBox(height: 15),
              buildLoginLink(),
              const SizedBox(height: 30),
              buildRegisterButton(),
              const SizedBox(height: 20),
              Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 3,
                      width: 25,
                      color: Colors.white,
                    ),
                    Text(
                      "Or",
                      style: TextStyle(
                        fontFamily: "Poppins-Bold",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Connect with",
                style: TextStyle(
                  fontFamily: "Poppins-Normal",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildConnecttwith("Google", 'assets/google.png'),
                    buildConnecttwith("More", 'assets/more.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConnecttwith(String text, String path) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xff130139),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              path,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: "Poppins-Normal",
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget buildInputField(
      String hintText, IconData icon, TextEditingController txcontroller) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: const Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: txcontroller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF8391A1),
            ),
            prefixIcon: Icon(
              icon,
              color: Color(0xFF8391A1),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordInputField(String hintText, IconData icon) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: const Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: _passwordTextfieldcontroller,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF8391A1),
            ),
            prefixIcon: Icon(
              icon,
              color: Color(0xFF8391A1),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Color(0xFF8391A1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            const Text(
              "already have account ? ",
              style: TextStyle(
                color: Color.fromARGB(255, 249, 249, 249),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
              (route) => false,
            );
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              color: Color(0xff130139),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: signup,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins-Bold",
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

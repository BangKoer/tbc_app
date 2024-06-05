import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tbc_app/pages/home.dart';
import 'package:tbc_app/pages/register.dart';
import 'package:tbc_app/services/firebase_authController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool? ischeck = false;
  final _emailTextfieldcontroller = TextEditingController();
  final _passwordTextfieldcontroller = TextEditingController();
  final FirebaseAuthController _auth = FirebaseAuthController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String usernamearg;
  late String emailarg;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextfieldcontroller.dispose();
    _passwordTextfieldcontroller.dispose();
    super.dispose();
  }

  void signinGoogle() async {
    User? user = await _auth.signInWithGoogle();
    if (user != null) {
      DocumentSnapshot userSnapshot =
          await _firestore.collection("users").doc(user!.uid).get();
      if (userSnapshot.exists) {
        setState(() {
          usernamearg = userSnapshot.get("username") ?? "";
          emailarg = userSnapshot.get("email") ?? "";
        });
      }
      print("Login Success");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login Success!"),
        backgroundColor: Colors.green,
      ));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: RouteSettings(arguments: {
            'username': usernamearg,
            'email': emailarg,
          }),
        ),
        (route) => false,
      );
    }
  }

  void signIn() async {
    String email = _emailTextfieldcontroller.text;
    String password = _passwordTextfieldcontroller.text;
    User? user = await _auth.loginwithEmailandPassword(email, password);
    if (user != null) {
      DocumentSnapshot userSnapshot =
          await _firestore.collection("users").doc(user!.uid).get();
      if (userSnapshot.exists) {
        setState(() {
          usernamearg = userSnapshot.get("username") ?? "";
          emailarg = userSnapshot.get("email") ?? "";
        });
      }
      print("Login Success");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login Success!"),
        backgroundColor: Colors.green,
      ));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: RouteSettings(arguments: {
            'username': usernamearg,
            'email': emailarg,
          }),
        ),
        (route) => false,
      );
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
                    "E-Mail",
                    style: TextStyle(
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInputField('Enter your email', Icons.email),
                ],
              ),
              const SizedBox(height: 30),
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
              buildRegisterLink(),
              const SizedBox(height: 30),
              buildLoginButton(),
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
        InkWell(
          onTap: () => signinGoogle(),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xff130139),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                path,
              ),
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

  Widget buildInputField(String hintText, IconData icon) {
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
          controller: _emailTextfieldcontroller,
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

  Widget buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: ischeck,
              onChanged: (value) {
                setState(() {
                  ischeck = value;
                });
              },
            ),
            const Text(
              "Remember me",
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
                builder: (context) => RegisterPage(),
              ),
              (route) => false,
            );
          },
          child: Text(
            "Register",
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

  Widget buildLoginButton() {
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
              onPressed: signIn,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Text(
                  "Login",
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

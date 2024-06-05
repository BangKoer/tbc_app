import 'package:flutter/material.dart';
import 'package:tbc_app/pages/about_app.dart';
import 'package:tbc_app/pages/home.dart';
import 'package:tbc_app/pages/onboard.dart';
import 'package:tbc_app/services/firebase_authController.dart';

class OptionPage extends StatefulWidget {
  final String name;
  final String email;

  const OptionPage({super.key, required this.name, required this.email});

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  bool isDarkMode = false;
  List<bool> isSelected = [false, true];
  final FirebaseAuthController _auth = FirebaseAuthController();

  void toggleMode(int index) {
    setState(() {
      if (index == 0) {
        isDarkMode = false;
        isSelected = [true, false];
      } else {
        isDarkMode = true;
        isSelected = [false, true];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppbar(
        name: widget.name,
        email: widget.email,
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins-Bold"),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff354D5B),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              // PhotoProfile
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
                radius: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins-Bold",
                  height: 1,
                ),
              ),
              Text(
                widget.email,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins-Normal",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              //   width: double.infinity,
              //   color: Color(0xff6889AA),
              //   child: const Text(
              //     "General Setting",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //       fontFamily: "Poppins-Bold",
              //     ),
              //   ),
              // ),
              // ListTile(
              //   leading: Icon(Icons.brightness_4, size: 30),
              //   title: Text("Mode"),
              //   subtitle: Text("Dark or Light"),
              //   trailing: ToggleButtons(
              //     children: [Icon(Icons.light_mode), Icon(Icons.dark_mode)],
              //     isSelected: isSelected,
              //     onPressed: toggleMode,
              //   ),
              // ),
              // ListTile(
              //     leading: Icon(Icons.key, size: 30),
              //     title: Text("Password"),
              //     trailing: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.arrow_forward_ios_outlined))),
              // ListTile(
              //     leading: Icon(Icons.translate, size: 30),
              //     title: Text("Language"),
              //     trailing: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.arrow_forward_ios_outlined))),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                width: double.infinity,
                color: Color(0xff6889AA),
                child: const Text(
                  "About App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Poppins-Bold",
                  ),
                ),
              ),
              ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutApp(
                          name: "About",
                          content: "tbc_free_app : 1.0.0",
                          path: "assets/logo.png",
                        ),
                      )),
                  leading: Icon(Icons.phone_android, size: 30),
                  title: Text("About app"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined))),
              ListTile(
                  leading: Icon(Icons.document_scanner, size: 30),
                  title: Text("Term and Condition"),
                  trailing: IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutApp(
                              name: "About",
                              content: "tbc_free_app : 1.0.0",
                              path: "assets/logo.png",
                            ),
                          )),
                      icon: Icon(Icons.arrow_forward_ios_outlined))),
              ListTile(
                  leading: Icon(Icons.shield, size: 30),
                  title: Text("Privacy Policy"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined))),
              ListTile(
                  leading: Icon(Icons.share, size: 30),
                  title: Text("Share this App"),
                  trailing: IconButton(
                      onPressed: () {
                        // final RenderBox box =
                        //     context.findRenderObject() as RenderBox;
                        // Share.share(
                        //   'Check out this awesome app: [App Link]',
                        //   subject: 'Awesome App',
                        //   sharePositionOrigin:
                        //       box.localToGlobal(Offset.zero) & box.size,
                        // );
                      },
                      icon: Icon(Icons.arrow_forward_ios_outlined))),
              InkWell(
                onTap: () {
                  setState(() {
                    _auth.signOut();
                  });
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardPage(),
                      ),
                      (route) => false);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  width: double.infinity,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Poppins-Bold",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

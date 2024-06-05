import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  final String name;
  final String path;
  final String content;
  const AboutApp(
      {super.key, required this.name, this.path = "", required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins-Bold"),
        ),
        backgroundColor: Color(0xff354D5B),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            path.isNotEmpty
                ? Image.asset(
                    path,
                    scale: 4,
                  )
                : SizedBox(),
            Text(
              content,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins-Bold"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String name;
  final String desc;
  final String path;
  DescriptionPage(
      {super.key, required this.desc, required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFE9F8),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(path),
              SizedBox(
                height: 5,
              ),
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

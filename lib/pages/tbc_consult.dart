import 'package:flutter/material.dart';
import 'package:tbc_app/pages/about_app.dart';
import 'package:tbc_app/pages/home.dart';

class TBC_Consult extends StatefulWidget {
  final String name;
  final String email;

  const TBC_Consult({super.key, required this.name, required this.email});
  @override
  State<TBC_Consult> createState() => _TBC_ConsultState();
}

class _TBC_ConsultState extends State<TBC_Consult> {
  final _searchTextfieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCFE9F8),
      bottomNavigationBar: CustomBottomAppbar(
        name: widget.name,
        email: widget.email,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 210,
            elevation: 0,
            backgroundColor: Color(0xffCFE9F8),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: CustomAppbar(
                  name: widget.name,
                  searchTextfieldcontroller: _searchTextfieldcontroller),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        // height: 100,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                        decoration: BoxDecoration(
                          color: Color(0xff354D5B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/consult.png")),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              "TBC Consult",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins-Bold",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutApp(
                                name: "In Development",
                                content: "Indevelopment",
                                path: "assets/development.png",
                              ),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/education.png",
                          text: "Education",
                          familyText: "Adigiana",
                          sizeFont: 20,
                        )),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutApp(
                                name: "In Development",
                                content: "Indevelopment",
                                path: "assets/development.png",
                              ),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/experconsult.png",
                          text: "Expert Consult",
                          familyText: "Adigiana",
                          sizeFont: 18,
                        )),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutApp(
                                name: "In Development",
                                content: "Indevelopment",
                                path: "assets/development.png",
                              ),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/tracker.png",
                          text: "Tracker",
                          familyText: "Adigiana",
                          sizeFont: 22,
                        )),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutApp(
                                name: "In Development",
                                content: "Indevelopment",
                                path: "assets/development.png",
                              ),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/detection.png",
                          text: "Early Detection",
                          familyText: "Adigiana",
                          sizeFont: 18,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

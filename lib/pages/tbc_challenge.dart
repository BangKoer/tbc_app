import 'package:flutter/material.dart';
import 'package:tbc_app/pages/home.dart';
import 'package:tbc_app/pages/quiz.dart';

class TBC_Challenge extends StatefulWidget {
  final String name;
  final String email;

  const TBC_Challenge({super.key, required this.name, required this.email});

  @override
  State<TBC_Challenge> createState() => _TBC_ChallengeState();
}

class _TBC_ChallengeState extends State<TBC_Challenge> {
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
                                    image: AssetImage("assets/challenge.png")),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              "TBC Challenge",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
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
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage(),
                            )),
                        child: CustomCategoriesItem(
                          path: "assets/quiz.png",
                          text: "Quiz",
                          familyText: "Adigiana",
                          sizeFont: 22,
                        )),
                    InkWell(
                        child: CustomCategoriesItem(
                      path: "assets/game.png",
                      text: "Game",
                      familyText: "Adigiana",
                      sizeFont: 18,
                    )),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

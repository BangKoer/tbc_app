import 'package:flutter/material.dart';
import 'package:tbc_app/pages/option.dart';
import 'package:tbc_app/pages/tbc_challenge.dart';
import 'package:tbc_app/pages/tbc_consult.dart';
import 'package:tbc_app/pages/tbc_pedia.dart';
import 'package:tbc_app/pages/tbc_solution.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchTextfieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map ??
        {'username': "Null"};
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCFE9F8),
      bottomNavigationBar: CustomBottomAppbar(
        name: data["username"],
        email: data["email"],
      ),
      // BottomNavigationBar(
      //   iconSize: 50,
      //   // currentIndex: currentIndexPage,
      //   fixedColor: Colors.white,
      //   unselectedItemColor: Colors.white,
      //   showUnselectedLabels: false,
      //   showSelectedLabels: false,
      //   backgroundColor: Color(0xff6889AA),
      //   // onTap: (newIndex) {
      //   //   setState(() {
      //   //     currentIndexPage = newIndex;
      //   //   });
      //   // },
      //   items: [
      //     BottomNavigationBarItem(
      //       label: "Home",
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Search",
      //       icon: Icon(Icons.add_circle_outlined),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Saved",
      //       icon: Icon(Icons.person_pin),
      //     ),
      //   ],
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 210,
            elevation: 0,
            backgroundColor: Color(0xffCFE9F8),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: CustomAppbar(
                name: data['username'],
                searchTextfieldcontroller: _searchTextfieldcontroller,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Column(
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                          color: Color(0xff222222),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins-Bold",
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
                              builder: (context) => TBC_Pedia(
                                name: data["username"],
                                email: data["email"],
                              ),
                            )),
                        child: CustomCategoriesItem(
                            path: "assets/pedia.png", text: "TBC Pedia")),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TBC_Challenge(
                              name: data["username"],
                              email: data["email"],
                            ),
                          )),
                      child: CustomCategoriesItem(
                          path: "assets/challenge.png", text: "TBC Challenge"),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TBC_Consult(
                                name: data["username"],
                                email: data["email"],
                              ),
                            )),
                        child: CustomCategoriesItem(
                            path: "assets/consult.png", text: "TBC Consult")),
                    InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TBC_Solution(
                                name: data["username"],
                                email: data["email"],
                              ),
                            )),
                        child: CustomCategoriesItem(
                            path: "assets/solution.png", text: "TBC Solution")),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Top Doctors",
                        style: TextStyle(
                          color: Color(0xff222222),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins-Bold",
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomDoctorItem(
                          name: "dr. Olivia Wilson",
                          path: "assets/wilson.jpg",
                          profession: "Consultant - Physiotherapy",
                          rating: "4.9 (37 Review)"),
                      CustomDoctorItem(
                          name: "dr. Jonathan Patterson",
                          path: "assets/asian.jpg",
                          profession: "Consultant - Physiotherapy",
                          rating: "4.9 (57 Review)"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomAppbar extends StatelessWidget {
  final String name;
  final String email;

  const CustomBottomAppbar({
    super.key,
    this.name = "Null",
    this.email = "Null",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: BoxDecoration(color: Color(0xff6889AA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                    settings: RouteSettings(arguments: {
                      'username': name,
                      'email': email,
                    }),
                  ),
                  (route) => false);
            },
            child: Icon(
              Icons.home,
              size: 45,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.add_circle,
            size: 45,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OptionPage(
                      name: name,
                      email: email,
                    ),
                  ));
            },
            child: Icon(
              Icons.person_pin,
              size: 45,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class CustomDoctorItem extends StatelessWidget {
  final String path;
  final String name;
  final String profession;
  final String rating;
  const CustomDoctorItem({
    super.key,
    required this.path,
    required this.name,
    required this.profession,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(path),
              radius: 35,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 18,
                    fontFamily: "Poppins-Medium",
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  profession,
                  style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins-Normal",
                    height: 1,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      rating,
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins-Normal",
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomCategoriesItem extends StatelessWidget {
  final String path;
  final String text;
  final String familyText;
  final double sizeFont;
  CustomCategoriesItem({
    super.key,
    required this.path,
    required this.text,
    this.familyText = "Poppins-Bold",
    this.sizeFont = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      padding: EdgeInsets.all(
        12,
      ),
      decoration: BoxDecoration(
        color: Color(0xff354D5B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(path),
                // fit: BoxFit.cover,
              ),
            ),
            // child: Image.asset(
            //   path,
            //   scale: 5,
            // ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: sizeFont,
              fontFamily: familyText,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  final TextEditingController _searchTextfieldcontroller;
  final String name;
  CustomAppbar({
    super.key,
    required TextEditingController searchTextfieldcontroller,
    this.name = "Null",
  }) : _searchTextfieldcontroller = searchTextfieldcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xff6889AA),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
                radius: 30,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      color: Color.fromARGB(255, 249, 249, 249),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins-Bold",
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 249, 249, 249),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins-Normal",
                      height: 1,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // search bar
          Container(
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
                controller: _searchTextfieldcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Color(0xFF8391A1),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      print(_searchTextfieldcontroller.text);
                      _searchTextfieldcontroller.clear();
                    },
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF8391A1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

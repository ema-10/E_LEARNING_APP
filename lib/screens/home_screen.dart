import 'package:flutter/material.dart';
import 'package:e_learning_app/screens/course_screen.dart';
import 'package:e_learning_app/widgets/about_app_w.dart';
import 'package:e_learning_app/widgets/book_w.dart';
import 'package:e_learning_app/widgets/motivation_w.dart';
import 'package:e_learning_app/widgets/l_w.dart';
import 'package:e_learning_app/widgets/take_a_break_w.dart';
import 'package:e_learning_app/widgets/notes_w.dart';
import 'package:e_learning_app/screens/draw_screen.dart';

class HomePage extends StatelessWidget {
  List catNames = [
    "About App",
    'Books',
    'Motivation',
    'Check list',
    'Take a break',
    'Notes',
  ];
  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0XFF6FE08D),
    Color(0XFF61BDFD),
    Color(0XFFFC7F7F),
    Color(0XFFCB84FB),
    Color(0XFF78E667),
  ];
  List<Icon> catIcons = [
    Icon(Icons.settings_applications, color: Colors.white, size: 30),
    Icon(Icons.library_books, color: Colors.white, size: 30),
    Icon(Icons.battery_6_bar, color: Colors.white, size: 30),
    Icon(Icons.checklist, color: Colors.white, size: 30),
    Icon(Icons.gamepad, color: Colors.white, size: 30),
    Icon(Icons.notes, color: Colors.white, size: 30),
  ];
  List imgList = [
    'Flutter',
    'React Native',
    'Python',
    'C#',
  ];

  List<List<String>> videoTitles = [
    ['Introduction to Flutter'],
    ['Introduction to React Native'],
    ['Introduction to C#'],
    ['Introduction to Python'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xFFFF0000),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Welcome, IUT Student",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here...",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (catNames[index] == "About App") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutAppW(),
                            ),
                          );
                        } else if (catNames[index] == 'Books') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookW(),
                            ),
                          );
                        } else if (catNames[index] == 'Motivation') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MotivationW(),
                            ),
                          );
                        } else if (catNames[index] == 'Check list') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LW(),
                            ),
                          );
                        } else if (catNames[index] == 'Take a break') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TakeABreakW(),
                            ),
                          );
                        } else if (catNames[index] == 'Notes') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotesW(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF0000),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: imgList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (4 * 240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(imgList[index]),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF5F3FF),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "images/${imgList[index]}.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              imgList[index],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "All videos",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: Color(0xFFFF0000),
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.draw), label: 'Draw'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DrawScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}

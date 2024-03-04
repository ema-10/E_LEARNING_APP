import 'package:flutter/material.dart';
import '../widgets/description_section.dart';
import '../widgets/videos_section.dart';

class CourseScreen extends StatefulWidget {
  String img;
  CourseScreen(this.img);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isVideoSection = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.img,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: Color(0xFFFF0000),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 221, 221),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isVideoSection
                          ? Color(0xFFFF0000)
                          : Color(0xFFFF0000).withOpacity(0.6),
                    ),
                    onPressed: () {
                      setState(() {
                        isVideoSection = true;
                      });
                    },
                    child: Text(
                      "VIDEO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isVideoSection
                          ? Color(0xFFFF0000).withOpacity(0.6)
                          : Color(0xFFFF0000),
                    ),
                    onPressed: () {
                      setState(() {
                        isVideoSection = false;
                      });
                    },
                    child: Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            isVideoSection
                ? VideoSection(videoList: getVideoTitles())
                : DescriptionSection(),
          ],
        ),
      ),
    );
  }

  List<String> getVideoTitles() {
    if (widget.img == 'Flutter') {
      return [
        'Introduction to Flutter',
      ];
    } else if (widget.img == 'React Native') {
      return [
        'Introduction to React Native',
      ];
    } else if (widget.img == 'C#') {
      return [
        'Introduction to C#',
      ];
    } else if (widget.img == 'Python') {
      return [
        'Introduction to Python',
      ];
    } else {
      return [];
    }
  }
}

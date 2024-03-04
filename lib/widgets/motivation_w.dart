import 'package:flutter/material.dart';

class MotivationW extends StatefulWidget {
  @override
  _MotivationWState createState() => _MotivationWState();
}

class _MotivationWState extends State<MotivationW> {
  final List<String> motivationalQuotes = [
    "You are capable of amazing things.",
    "Believe in yourself and all that you are.",
    "The only way to do great work is to love what you do.",
    "Your attitude determines your direction.",
    "Don't watch the clock; do what it does. Keep going.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "You are never too old to set another goal or to dream a new dream.",
    "The only limit to our realization of tomorrow will be our doubts of today.",
    "You are stronger than you think.",
  ];

  int currentIndex = 0;
  bool showRed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motivation", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: showRed
                ? [Colors.red, Colors.white]
                : [Colors.white, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: Padding(
                  key: ValueKey<int>(currentIndex),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    motivationalQuotes[currentIndex],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: showRed ? Colors.white : Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex =
                        (currentIndex + 1) % motivationalQuotes.length;
                    showRed = !showRed;
                  });
                },
                child: Text(
                  "Next Quote",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
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

void main() {
  runApp(MaterialApp(
    home: MotivationW(),
  ));
}

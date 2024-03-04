import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LW extends StatefulWidget {
  @override
  _LWState createState() => _LWState();
}

class _LWState extends State<LW> {
  List<Task> tasks = [
    Task("Learn Flutter basics", false),
    Task("Learn Dart basics", false),
    Task("Build a Flutter app using Dart", false),
    Task("Write project documentation", false),
  ];

  @override
  void initState() {
    super.initState();
    loadSavedTasks();
  }

  Future<void> loadSavedTasks() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks.forEach((task) {
        task.completed = prefs.getBool(task.name) ?? false;
      });
    });
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks.forEach((task) {
      prefs.setBool(task.name, task.completed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHECKLIST", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFF0000),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index].name,
              style: TextStyle(
                color: Color(0xFFFF0000),
                fontSize: 24.0, // Increase font size
              ),
            ),
            trailing: Checkbox(
              value: tasks[index].completed,
              activeColor: Color(0xFFFF0000),
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  tasks[index].completed = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width *
            0.8, // Centriranje i povećanje širine
        height: 100.0,
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          onPressed: () {
            saveTasks();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Checklist saved!', style: TextStyle(fontSize: 20.0)),
                backgroundColor: Color(0xFFFF0000),
              ),
            );
          },
          label: Text("SAVE CHECKLIST",
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          icon: Icon(Icons.save),
          backgroundColor: Color(0xFFFF0000),
        ),
      ),
    );
  }
}

class Task {
  String name;
  bool completed;

  Task(this.name, this.completed);
}

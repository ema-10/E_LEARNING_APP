import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red, // Postavljamo crvenu boju olovke
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Postavljamo crvenu boju AppBar-a
        title: Text(
          'Draw',
          style:
              TextStyle(color: Colors.white), // Bijela boja teksta u AppBar-u
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
            ),
            child: Signature(
              controller: _controller,
              height: 300,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DrawScreen(),
  ));
}

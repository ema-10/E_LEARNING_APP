import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BookW extends StatelessWidget {
  final String dartBookPath = "bookselearning/dartprogramskijezik.pdf";
  final String flutterBookPath = "bookselearning/flutterframework.pdf";

  Future<void> _openPDF(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.copy('${(await getTemporaryDirectory()).path}/book.pdf');
        print('PDF successfully copied to temporary directory.');
      } else {
        print('File does not exist at path: $path');
      }
    } catch (e) {
      print('Error opening file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFF0000), // Crvena boja
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBookWidget("Knjiga Flutter", flutterBookPath),
          buildBookWidget("Knjiga Dart", dartBookPath),
        ],
      ),
    );
  }

  Widget buildBookWidget(String bookTitle, String bookPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bookTitle,
            style: TextStyle(
              color: Color(0xFFFF0000), // Crvena boja
              fontSize: 24.0, // Duplo veća veličina teksta
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _openPDF(bookPath);
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFF0000), // Crvena boja
            ),
            child: Text(
              "PREUZMI",
              style: TextStyle(
                color: Colors.white, // Bijela boja
                fontSize: 16.0, // Duplo veća veličina teksta
              ),
            ),
          ),
        ],
      ),
    );
  }
}

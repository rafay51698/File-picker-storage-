import 'package:cloudfirestore/helper/storage_helper.dart';
import 'package:cloudfirestore/theme.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var results;
  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                results = await FilePicker.platform
                    .pickFiles(type: FileType.custom, allowedExtensions: [
                  'pdf',
                  'jpeg',
                  'png',
                  'jpg',
                ]);
                setState(() {
                  results = results;
                });
                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'No file Selected',
                    style: style(),
                  )));
                }
                // ignore: avoid_print
                print(results.files);
                final pathname = results.single.path;
                final filename = results.single.name;
              },
              child: const Text("Upload files"),
            ),
          ),
          if (results != null)
            Container(
              child: Image.file(
                File(results.files.single.path),
              ),
            ),
        ],
      ),
    );
  }

  style() {
    TextStyle(
        color: Colors.indigo[600], fontSize: 25, fontWeight: FontWeight.bold);
  }
}

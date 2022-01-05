// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_escapes, unnecessary_new, unused_local_variable, unused_import, file_names, avoid_print, unnecessary_null_comparison, curly_braces_in_flow_control_structures

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadData extends StatefulWidget {
  @override
  _UploadDataState createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  Future selectFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result == null)
//       return null; // if user don't pick any thing then do nothing just return.

//     PlatformFile file = result!.files.first;

//     print('File Name: ${file?.name}');
//     print('File Size: ${file?.size}');
//     print('File Extension: ${file?.extension}');
//     print('File Path: ${file?.path}');
// //now do something with file selected
//     final path = file?.path;
//     final fileName = file?.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Storage"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  selectFile();
                },
                child: Text("Select Data", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Upload Data", style: TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

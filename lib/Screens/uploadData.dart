// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_escapes, unnecessary_new, unused_local_variable, unused_import, file_names, avoid_print, unnecessary_null_comparison, curly_braces_in_flow_control_structures, unused_field, deprecated_member_use, avoid_init_to_null

import 'dart:io';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:learning1/Screens/storage_service.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class UploadData extends StatefulWidget {
  @override
  _UploadDataState createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  final Storage storage = new Storage();
  var path = null;
  var fileName = null;

  Future pickImage(BuildContext context) async {
    // SELLECTING FILE
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );
    if (results == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No file Selected!"),
        ),
      );
      return null;
    }
    setState(() {
      path = results.files.single.path;
      fileName = results.files.single.name;
    });

    // CALLING UPLOAD FUNCTION
    storage.uploadFile(path, fileName);
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
                  pickImage(context);
                },
                child: Text("Upload Data", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                  future: storage.downloadURL(fileName),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Container(
                        height: 250,
                        width: 250,
                        child: Image.network(
                          snapshot.data!,
                          fit: BoxFit.contain,
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

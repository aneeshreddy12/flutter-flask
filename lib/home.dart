/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String? _filePath;
  String? predicted;
  String prediction = '';
  Future<void> uploadAudio(File audioFile) async {
    final url =
        "http://10.0.2.2:5000//predict"; // Change this to your Flask back-end URL
    var request = await http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('audio', audioFile.path));
    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    setState(() {
      prediction = responseData;
    });
    print(responseData);
  }

  Future<void> pickWavFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _filePath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predictor'),
        backgroundColor: Color.fromARGB(255, 58, 12, 119),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: pickWavFile,
              child: Text('Select .wav file'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 58, 12, 119)),
            ),
            SizedBox(height: 20),
            _filePath != null
                ? Text('Selected file: $_filePath')
                : Text('No file selected'),
            ElevatedButton(
              onPressed: () async {
                await uploadAudio(File(_filePath ?? ""));
              },
              child: Text('Predict'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 58, 12, 119)),
            ),
            prediction != '' ? Text('Prediction : $prediction') : Text('')
          ],
        ),
      ),
    );
  }
}*/

import 'package:dltest/home.dart';
import 'package:flutter/material.dart';
import 'audioplayer.dart';
import 'home_audio.dart';

void main() => runApp(Picker());

class Picker extends StatefulWidget {
  const Picker({super.key});

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

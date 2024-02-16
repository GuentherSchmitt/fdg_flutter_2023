// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

String helloText = "Hello World";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double sliderValue = 0;
  String enteredText = "";

  @override
  Widget build(BuildContext context) {
    print("in build of _MainPageState");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(helloText),
            ElevatedButton(
                onPressed: () {
                  print("in onPressed");
                  setState(() {
                    helloText += "!";
                  });
                  print("helloText is now $helloText");
                },
                child: const Text("Append a '!' to the text above")),

            const SizedBox(height: 50),
            Slider(
                min: 0,
                max: 100,
                divisions: 10,
                label: sliderValue.toStringAsFixed(1),
                value: sliderValue,
                onChanged: (value) {
                  print("in onChanged, value=$value");
                  setState(() {
                    sliderValue = value;
                  });
                }),
            Text("sliderValue is ${sliderValue.toStringAsFixed(1)}"),

            const SizedBox(height: 50),
            TextField(
              onChanged: (value) {
                setState(() {
                  enteredText = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Text("enteredText is '$enteredText'"),
          ],
        ),
      ),
    );
  }
}

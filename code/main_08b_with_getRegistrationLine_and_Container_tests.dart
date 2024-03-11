// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

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
  String userName = "";
  String userAddress = "";
  String userEMail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Registration Form"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            getRegistrationLine("Name", "Please enter your name", (value) {
              setState(() {
                userName = value;
              });
            }),
            getRegistrationLine("Address", "Please enter your address",
                (value) {
              setState(() {
                userAddress = value;
              });
            }),
            getRegistrationLine("EMail", "Please enter your email", (value) {
              setState(() {
                userEMail = value;
              });
            }),
            // tests for conatiner "box model" (container with border and padding)
            ElevatedButton(onPressed: () {}, child: const Text("Register")),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              width: 300,
              height: 100,
              //color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.green, width: 10)),
              //child: const Text("xxxx", style: TextStyle(backgroundColor: Colors.blue),),
              child: Container(color: Colors.blue),
            ),
            const SizedBox(height: 20),
            // tests with gradient colors
            Container(
              width: 300,
              height: 250,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue, Colors.yellow])),
            )
          ],
        ),
      ),
    );
  }

  Widget getRegistrationLine(
      String label, String hint, Function(String) callback) {
    return Container(
      color: Colors.grey,
      // padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(143, 245, 129, 0.486),
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        onChanged: callback,
      ),
    );
  }
}

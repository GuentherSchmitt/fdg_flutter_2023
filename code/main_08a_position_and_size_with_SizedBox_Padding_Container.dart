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
    var screenWidth = MediaQuery.of(context).size.width;
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
            SizedBox(
              width: screenWidth - 20,
              child: TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(245, 243, 129, 1),
                  labelText: "Name",
                  hintText: "Please enter your name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(245, 243, 129, 1),
                  labelText: "Address",
                  hintText: "Please enter your address",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onChanged: (value) {
                  setState(() {
                    userAddress = value;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(245, 243, 129, 1),
                  labelText: "eMail",
                  hintText: "Please enter your eMail",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onChanged: (value) {
                  setState(() {
                    userEMail = value;
                  });
                },
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}

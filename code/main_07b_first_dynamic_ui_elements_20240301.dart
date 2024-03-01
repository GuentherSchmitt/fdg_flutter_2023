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
  bool? checkboxValue = false;
  bool? checkboxValue2 = false;

  @override
  Widget build(BuildContext context) {
    print("in build of _MainPageState");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          
        },
        child: const Icon(Icons.dangerous)),
      //backgroundColor: Colors.green,
      appBar: AppBar(
        actions: [IconButton(onPressed:() {
          print("in iconbutton onPressed");
        }, icon: const Icon(Icons.baby_changing_station))],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Basic UI"),
      ),
      body: Center(
        child: SingleChildScrollView(
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
          
              const SizedBox(height: 400),
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
          
              Slider(
                  min: 0,
                  max: 100,
                  value: sliderValue, onChanged: onChanged),
          
              const SizedBox(height: 50),
              TextField(
                //obscureText: true,
                textCapitalization: TextCapitalization.sentences,
                decoration:const InputDecoration(labelText: "Name",
                hintText: "Please enter your name",
                //counterText: "${enteredText.length}",
                border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    enteredText = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text("enteredText is '$enteredText'"),
          
          
              Checkbox(
                activeColor: Colors.green,
                splashRadius: 40,
                side:const BorderSide(color: Colors.red, width: 4),
                //tristate: true,
                value: checkboxValue, onChanged:(value) {
                               print("checkBox value is $value" );
                setState(() {
                  checkboxValue = value;
                });
              },),
          
              const Card(
                elevation: 10,
                child: ListTile(
                  leading: Icon(Icons.person),
                  
                  tileColor: Colors.green,
                  title: Text("Max Mustermnann"),
                  subtitle: Text("Berlin"),
                ),
              ),
              const ListTile(
                tileColor: Colors.grey,
                title: Text("Günther Schmitt"),
                subtitle: Text("Großostheim"),
              ),
          
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("please confirm our conditions"),
                subtitle: const Text("otherwise you cannot continue"),
                tileColor: Colors.yellow,
                value: checkboxValue2, onChanged: (value) {
                               print("checkBox value is $value" );
                setState(() {
                  checkboxValue2 = value;
                });
              })
            ],
          ),
        ),
      ),
    );
  }

  void onChanged(double value) {
    setState(() {
          sliderValue = value;
    });
  }
}

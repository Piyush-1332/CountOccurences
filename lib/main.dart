import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Task",
      theme: new ThemeData(primarySwatch: Colors.teal),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> _count = [0];
  List<String> _finalString = ["str"];
  final myController = TextEditingController();
  String output = "";
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void doTask() {
    String str = myController.text;
    countOccurences(str);
        myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Task"),
        centerTitle: true,
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(hintText: "Enter a String"),
              controller: myController,
            ),
            new MaterialButton(
              color: Colors.tealAccent,
              onPressed: doTask,
              child: new Text("Submit"),
            ),
            new Text('Output',style: new TextStyle(fontSize: 20.0,decoration: TextDecoration.underline)),
            new Text(
              '$output',
              style: new TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            new Text("PIYUSH SRIVASTAV"),
            new Text("piyush1332@gmail.com")
          ],
        ),
      ),
    );
  }

  void getValues(List<String> str, List<int> count) {
    List<String> string = [];
    List<int> countnew = [];
    String setstr = "";
    for (var i = 0; i < str.length; i++) {
      if (string.contains(str[i]) || count[i]<=1) {
      } else {
        string.add(str[i]);
        countnew.add(count[i]);
      }
    }
    for (var j = 0; j < string.length; j++) {
      setstr = setstr + "${string[j]} : ${countnew[j]} \n";
    }
    setState(() {
      output = setstr;
    });
  }

  void countOccurences(String str) {
    List<String> string = str.split(" ");
    int lengthofString = string.length;
    List<int> count = [];
    int j = 0;
    while (j < lengthofString) {
      count.add(0);
      j++;
    }
    int i = 0;
    while (i < lengthofString) {
      int k = 0;
      while (k < lengthofString) {
        if (string[i] == string[k]) {
          count[i]++;
        }
        k++;
      }
      i++;
    }
    print(count);
    setState(() {
      _finalString = string;
      _count = count;
    });
    getValues(_finalString, _count);
  }
}

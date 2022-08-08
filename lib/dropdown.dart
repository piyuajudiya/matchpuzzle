import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  List<String> city = ["1", "2", "3", "4", "5", "6"];
  List<String> name = ["aa", "bb", "cc", "dd", "ee", "ff"];
  List<bool> a1 = [false, false, false, false, false, false];
  String v = "1";
  bool a = false;

  List item = [];

  List<DropdownMenuItem<String>> getdata() {
    List<DropdownMenuItem<String>> list = [];
    for (int i = 0; i < city.length; i++) {
      list.add(DropdownMenuItem(
        child: Text(city[i]),
        value: city[i],
      ));
    }
    return list;
  }

  box() {
    for (int i = 1; i <= 10; i++) {
      CheckboxListTile(
        value: i as bool,
        onChanged: (value) {
          setState(() {
            // i = value as bool;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        title: Text("i"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DropdownButton(
              onChanged: (value) {
                //  print(value);
                setState(() {
                  v = value as String;
                });
              },
              value: v,
              items: getdata()),
          ElevatedButton(
              onPressed: () {
                print("$v");
              },
              child: Text("submit")),

        ],
      ),
    );
  }
}

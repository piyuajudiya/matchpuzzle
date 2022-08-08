import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cbox extends StatefulWidget {
  const cbox({Key? key}) : super(key: key);

  @override
  _cboxState createState() => _cboxState();
}

class _cboxState extends State<cbox> {
  List<String> m = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
  List<bool> a = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  // List<bool> getdata() {
  //   List<bool> list = [];
  //   for (int i = 0; i < a.length; i++) {
  //     list.add(bool(
  //       child: Text(m[i]),
  //       value: a[i],
  //     ));
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABC"),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Row(
                  children: [
                    Text(m[index]),
                  ],
                ),
                value: a[index],
                onChanged: (value) {
                  if (value != null) {
                    a[index] = value;
                  }
                  setState(() {});
                },
              );
            },
            itemCount: m.length,
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matchpuzzle/delete.dart';

import 'dropdown.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: cbox(),
  ));
}

class fruit extends StatefulWidget {
  const fruit({Key? key}) : super(key: key);

  @override
  State<fruit> createState() => _fruitState();
}

class _fruitState extends State<fruit> {
  Future<List<String>> _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .toList();

    return imagePaths;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initImages().then((value) {
      value.forEach((element) {
        //  print(element);
        setState(() {
          images.add(element);
          images.add(element);
          images.shuffle();
        });
      });
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        visible = List.filled(12, false);
      });
    });
    timer();
  }

  timer() async {
    for (int i = 0; i <= 29; i++) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        s++;
      });
    }
  }

  bool tap = false;
  int t = 1;
  String s1 = "", s2 = "";
  int pos1 = 0, pos = 0;
  List images = [];
  List<bool> visible = List.filled(12, true);
  bool click = true;
  double s = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MATCH PUZZLE"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (t == 1 && visible[index] == false) {
                        setState(() {
                          visible[index] = true;
                          s1 = images[index];
                          pos = index;
                          t = 2;
                        });
                        //   print("imagename=$s1,\tposition1=$pos");
                      } else {
                        if (click && visible[index] == false) {
                          setState(() {
                            visible[index] = true;
                            s2 = images[index];
                            pos1 = index;
                            click = false;
                          });

                          if (s1 == s2 && s1 != "" && s2 != "") {
                            {
                              print(" hello ");
                              Future.delayed(Duration(seconds: 1))
                                  .then((value) {
                                setState(() {
                                  visible[pos] = true;
                                  visible[pos1] = true;
                                  t = 1;
                                  click = true;
                                  s = s - 5;
                                });
                              });
                            }
                          } else {
                            Future.delayed(Duration(seconds: 1)).then((value) {
                              setState(() {
                                visible[pos] = false;
                                visible[pos1] = false;
                                t = 1;
                                click = true;
                              });
                            });
                          }
                        }
                      }
                      // print("imagename=$s2,\tposition1=$pos1");
                    },
                    child: Visibility(
                      visible: visible[index],
                      replacement: Container(
                        height: 100,
                        width: 100,
                        color: Colors.green,
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Image.asset("${images[index]}"),
                      ),
                    ));
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
            ),
          ),
          Row(
            children: [
              Text("${s.toInt()}"),
              Expanded(
                child: Container(
                  child: Slider(
                    onChanged: (value) {
                      setState(() {});
                    },
                    max: 30,
                    min: 1,
                    value: s,
                  ),
                ),
              ),
              Text("30"),
            ],
          )
        ],
      ),
    );
  }
}

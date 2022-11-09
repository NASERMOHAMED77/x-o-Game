// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool oturn = true;
  int x = 0;
  int o = 0;
  List color = [
    Colors.pink,
    Colors.green,
    Colors.pink,
    Colors.green,
    Colors.pink,
    Colors.green,
    Colors.pink,
    Colors.green,
    Colors.pink
  ];
  List<String> displayxo = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Expanded(

              child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    'X',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Score : $x',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 80,
              ),
              Column(
                children: [
                  Text(
                    'O',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Score : $o',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )),
          Expanded(
            
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tap(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink, width: 2)),
                          child: Center(
                            child: Text(
                              displayxo[index],
                              style: TextStyle(
                                  fontSize: 50,
                                  color: color[index],
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink.shade400,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    xxox();
                  },
                  child: Text(
                    'Empty Board',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  _tap(index) {
    
    setState(() {
      if (oturn && displayxo[index] == '') {
        displayxo[index] = 'O';
        color[index] = Colors.green;
      } else if (oturn == false && displayxo[index] == '') {
        displayxo[index] = 'X';
        color[index] = Colors.pink;
      }
      oturn = !oturn;
      _check();
    });
  }

  _check() { 

    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      _winner(displayxo[0]);
    }

    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      _winner(displayxo[0]);
    }
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      _winner(displayxo[0]);
    }
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      _winner(displayxo[1]);
    }
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      _winner(displayxo[2]);
    }
    if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != '') {
      _winner(displayxo[2]);
    }
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      _winner(displayxo[3]);
    }
    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      _winner(displayxo[6]);
    }
  }

  _noonewin() {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'No One Win',
              style: const TextStyle(fontSize: 20),
            ),
            actions: [
              Container(
                color: Colors.pink,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    xxox();
                  },
                  child: Text('Play Again'),
                ),
              )
            ],
          );
        });
  }

  _winner(String winner) {
    

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'The Winner is : $winner',
              style: const TextStyle(fontSize: 20),
            ),
            actions: [
              Container(
                color: Colors.pink,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    xxox();
                  },
                  child: Text('Play Again'),
                ),
              )
            ],
          );
        });
    if (winner == 'X') {
      x += 1;
    } else {
      o += 1;
    }
  }

  xxox() {

    setState(() {
      for (var i = 0; i < displayxo.length; i++) {
        displayxo[i] = '';
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/main.dart';
import 'package:project/x.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 150),
                height: 200,
                width: 200,
                child: Image(image: AssetImage('images/x.png'))),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink.shade400,
                    borderRadius:const  BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 219, 223, 220),
                        fontFamily: 'Rubik',
                        fontStyle: FontStyle.normal),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

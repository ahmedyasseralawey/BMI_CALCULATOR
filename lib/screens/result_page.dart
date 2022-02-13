import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double BMI;

  const ResultPage({Key? key, required this.BMI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator BMI"),
      ),
      body: _body(),
    );
  }

  _body() {
    List results = getResult();
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(" Your Result",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.white10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(results[0].toUpperCase(),
                                  style: TextStyle(
                                      color: results[1],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(BMI.toString(),
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(results[2],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 18)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  List getResult() {
    if (BMI < 18.5) {
      return [
        "under weight",
        Colors.orangeAccent,
        "You have a low body weight. You should gain some weight!"
      ];
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return [
        "Normal",
        Colors.greenAccent,
        "You have a normal body weight. Good job!"
      ];
    } else if (BMI >= 25 && BMI <= 29.9) {
      return [
        "Overweight",
        Colors.deepOrange,
        "You have an overweight body weight. You need to lose some weight!"
      ];
    } else if (BMI >= 30 && BMI <= 34.9) {
      return [
        "Obesity I",
        Colors.redAccent,
        "You have a body weight in obesity level 1. You must lose weight!"
      ];
    } else if (BMI >= 35 && BMI <= 39.9) {
      return [
        "Obesity II",
        Colors.redAccent,
        "You have a body weight in obesity level 2. You must lose weight!"
      ];
    } else if (BMI >= 40 && BMI <= 49.9) {
      return [
        "Obesity III",
        Colors.red,
        "You have a body weight in obesity level 3. You must lose weight now!"
      ];
    } else {
      return [
        "Obesity IV",
        Colors.red,
        "You have a body weight in obsidian novel 4. You need to lose weight urgently!"
      ];
    }
  }
}

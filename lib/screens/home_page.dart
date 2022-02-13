import 'package:bmi_calculator/components/button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentSliderValue = 1;
  int _currentAgeValue = 10;
  int _currentWeightValue = 10;
  bool active = true;
  double BMI = 0.0;

  @override
  void initState() {
    super.initState();
  }

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
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Button(
                title: "Male",
                color: !active ? Colors.white10 : Colors.black12,
                method: () {
                  setState(() {
                    active = !active;
                  });
                },
              ),
              Button(
                title: "Female",
                color: active ? Colors.white10 : Colors.black12,
                method: () {
                  setState(() {
                    active = !active;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
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
                        const Text(
                          "HEIGHT",
                          style: TextStyle(color: Colors.white70),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_currentSliderValue.toInt()}",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "cm",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 250,
                          divisions: 250,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          thumbColor: Colors.red,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(
                              () {
                                _currentSliderValue = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getCard(
                title: "WEIGHT",
                currentValue: _currentWeightValue,
                methodRemove: () {
                  setState(
                    () {
                      _currentWeightValue--;
                    },
                  );
                },
                methodAdd: () {
                  setState(
                    () {
                      _currentWeightValue++;
                    },
                  );
                },
              ),
              _getCard(
                title: "AGE",
                currentValue: _currentAgeValue,
                methodRemove: () {
                  setState(
                    () {
                      _currentAgeValue--;
                    },
                  );
                },
                methodAdd: () {
                  setState(
                    () {
                      _currentAgeValue++;
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Calculate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    BMI = (_currentWeightValue /
                        (_currentSliderValue /
                            100 *
                            _currentSliderValue /
                            100));
                    BMI = ((BMI * 1000).ceil() / 1000);
                    if (kDebugMode) {
                      print(BMI);
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(BMI: BMI),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _getCard(
      {required String title,
      int currentValue = 0,
      dynamic methodRemove,
      dynamic methodAdd}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.white10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${currentValue.toInt()}",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                        onPressed: methodRemove,
                        child: const Icon(
                          Icons.remove,
                        ),
                        shape: const CircleBorder(
                          side: BorderSide.none,
                        ),
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: MaterialButton(
                        onPressed: methodAdd,
                        child: const Icon(
                          Icons.add,
                        ),
                        shape: const CircleBorder(side: BorderSide.none),
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

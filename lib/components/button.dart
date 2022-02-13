import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final dynamic method;

  const Button(
      {Key? key,
      required this.title,
      required this.color,
      required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          color: color,
          onPressed: method,
          child: Column(
            children: [
              Text(
                "\n$title",
                style: const TextStyle(color: Colors.white70, fontSize: 50),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

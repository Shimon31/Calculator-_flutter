import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  Map<String, double> formValues = {"num1": 0, "num2": 0, "sum": 0};

  void num1Change(value) {
    formValues.update("num1", (v) => double.parse(value));
  }

  void num2Change(value) {
    formValues.update("num2", (v) => double.parse(value));
  }

  void add() {
    double num1 = formValues["num1"] ?? 0.0;
    double num2 = formValues["num2"] ?? 0.0;
    double sum = num1 + num2;
    setState(() {
      formValues.update("sum", (v) => sum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  num1Change(value);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  num2Change(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {add();},
                child: Text("Add", style: TextStyle(color: Colors.green[900])),
              ),
              
              Text("Result: ${formValues["sum"].toString()}")
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Complete_Calculator extends StatefulWidget {
  const Complete_Calculator({super.key});

  @override
  State<Complete_Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Complete_Calculator> {
  String display = "0";
  String firstNumber = "";
  String operation = "";
  bool isNewNumber = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
        backgroundColor: Colors.orange[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    operation.isNotEmpty ? "$firstNumber $operation" : "",
                    style: TextStyle(fontSize: 16, color: Colors.grey[300]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    display,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),

            // Buttons section (Expanded here)
            Expanded(
              child: Column(
                children: [
                  //first Row
                  Row(
                    children: [
                      Expanded(child: _buildButton("C", Colors.red, _clear)),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton("CE", Colors.red, _clearEntry),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "/",
                          Colors.yellow[800]!,
                              () => _operation('/'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "*",
                          Colors.yellow[800]!,
                              () => _operation("*"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  //second Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                          "9",
                          Colors.grey,
                              () => _addDigit('9'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "8",
                          Colors.grey,
                              () => _addDigit('8'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "7",
                          Colors.grey,
                              () => _addDigit('7'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "+",
                          Colors.yellow[800]!,
                              () => _operation("+"),
                        ),
                      ),
                    ],
                  ),
                  //Third Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                          "6",
                          Colors.grey,
                              () => _addDigit('6'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "5",
                          Colors.grey,
                              () => _addDigit('5'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "4",
                          Colors.grey,
                              () => _addDigit('4'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "-",
                          Colors.yellow[800]!,
                              () => _operation("-"),
                        ),
                      ),
                    ],
                  ),
                  //Fourth Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                          "3",
                          Colors.grey,
                              () => _addDigit('3'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "2",
                          Colors.grey,
                              () => _addDigit('2'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "1",
                          Colors.grey,
                              () => _addDigit('1'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          "=",
                          Colors.green[800]!,
                          _result,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color == Colors.grey ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _clear() {
    setState(() {
      display = "0";
      firstNumber = "";
      operation = "";
      isNewNumber = true;
    });
  }

  void _clearEntry() {
    setState(() {
      display = "0";
      isNewNumber = true;
    });
  }

  void _operation(String _operation) {
    setState(() {
      firstNumber = display;
      operation = _operation;
      isNewNumber = true;
    });
  }

  void _addDigit(String digit) {
    setState(() {
      if (isNewNumber) {
        display = digit;
        isNewNumber = false;
      } else {
        if (display == "0") {
          display = digit;
        } else {
          display += digit;
        }
      }
    });
  }

  void _result() {
    if (firstNumber.isNotEmpty && operation.isNotEmpty) {
      setState(() {
        double first = double.parse(firstNumber);
        double second = double.parse(display);
        double result = 0;

        switch (operation) {
          case '+':
            result = first + second;
            break;

          case "-":
            result = first - second;
            break;

          case "*":
            result = first * second;
            break;

          case "/":
            if(second!=0){
              result = first/second;
            }else{
              display = "Error";
              firstNumber ="";
              operation = "";
              isNewNumber= true;
              return;
            }
            break;
        }

        display = result.toString();
        if(display.endsWith('.0')){
          display = display.substring(0,display.length -2);
        }

      });
    }
  }
}

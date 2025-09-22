import 'package:calculator/complete_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Calculator.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Complete_Calculator(),
    );
  }

}
// ignore: file_names
import 'package:calculator/buildbutton.dart';
import 'package:calculator/buttondata.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // void onButtonPress(String numop){
  //   final _selection == Btn.buttonValues.where((element) => )
  // }
  String number1 = ""; // . 0-9
  String operator1 = ""; // =,/,
  String number2 = ""; // . 0-9
  void onBtnTap(String value) {
    setState(() {
      number1+= value;
      operator1+= value;
      number2+= value;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "Calculator",
            textAlign: TextAlign.left,
            style: TextStyle(backgroundColor: Color.fromARGB(0, 0, 0, 0)),
          )),
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      body: SingleChildScrollView(
        child: Column(
          //* Output area
          children: [
            Container(
              alignment: Alignment.bottomRight,
              height: 250,
              child: Text(
                "$number1$operator1$number2".isEmpty ? "0" : "$number1$operator1$number2",
                textAlign: TextAlign.end,
                style:const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //button
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (characters) => NumberButton(
                      bvalue: characters,
                      onButtonPress: (String valueb) {onBtnTap(valueb);print(valueb);},
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

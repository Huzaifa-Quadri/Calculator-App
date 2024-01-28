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
              child: const Text(
                "0",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //button
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (characters) => NumberButton(bvalue: characters),
                  ).toList(),
            )
          ],
        ),
      ),
    );
  }
}

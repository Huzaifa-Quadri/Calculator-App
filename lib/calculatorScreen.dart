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
    if (value == Btn.del) {
      delete();
      return;
    }
    if (value == Btn.clr) {
      allclear();
      return;
    }
    if (value == Btn.per) {
      converttopercentage();
      return;
    }
    if (value == Btn.calculate) {
      calculate();
      return;
    }

    
    valueinput(value);
  }

  void valueinput(String value){
    if (value!=Btn.dot && int.tryParse(value)==null) {
      if (operator1.isNotEmpty&&number2.isNotEmpty) {
        //TODO: Calculate the equation before assigning new operand
        calculate();
      }
      operator1 = value;
    }
    else if(number1.isEmpty || operator1.isEmpty){
      if (value == Btn.dot && number1.contains(Btn.dot)) return ; 
      if (value == Btn.dot && (number1.isEmpty || number1 == Btn.n0)) {
        //* number 1 = "" OR number1 = "."
        value = "0.";
      }
      number1+=value; 
    }
    else if(number2.isEmpty || operator1.isNotEmpty){
      if (value == Btn.dot && number2.contains(Btn.dot)) return ; 
      if (value == Btn.dot && (number2.isEmpty || number2 == Btn.n0)) {
        //* number 1 = "" OR number1 = "."
        value = "0.";
      } 
      number2+=value;
    }
    setState(() {});
  }

    //! For delete button 
  void delete(){
    if (number2.isNotEmpty) {
      number2 = number2.substring(0,number2.length-1);
    }
    else if(operator1.isNotEmpty){
      operator1 = "";
    }
    else if(number1.isNotEmpty){
      number1 = number1.substring(0,number1.length-1);
    }
    setState(() {});
  }

  void allclear(){
    number1 = "";
    operator1 ="";
    number2 = "";
    setState(() {});
  }

  void converttopercentage(){

    if (number1.isNotEmpty && operator1.isNotEmpty && number2.isNotEmpty) {
      calculate();
    }
    if (operator1.isNotEmpty) return;

    final number = double.parse(number1);
    setState(() {
      number1 = "${(number/100)}";
      operator1 = "";
      number2 = "";
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
  void calculate(){
    if(number1.isEmpty) return;
    if(operator1.isEmpty) return;
    if(number2.isEmpty) return;
    final double num1 = double.parse(number1);
    final double num2 = double.parse(number2);
    var result = 0.0;
    switch (operator1) {
      case Btn.add:
        result = num1+num2;
        break;
      case Btn.subtract:
        result = num1-num2;
        break;
      case Btn.multiply:
        result = num1*num2;
        break;
      case Btn.divide:
        result = num1/num2;
        break;
      default:
    }

    setState(() {
      number1 = result.toStringAsPrecision(5);
      if (number1.contains(".0")) {
        number1 = number1.substring(0,number1.length-2);
      }     
      number2 = "";
      operator1 = "";
    });
  }
}

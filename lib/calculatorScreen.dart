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
      converttoper();
      return;
    }

    
    valueinput(value);
  }

  void valueinput(String value){
    if (value!=Btn.dot && int.tryParse(value)==null) {
      if (operator1.isNotEmpty&&number2.isNotEmpty) {
        //TODO: Calculate the equation before assigning new operand
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

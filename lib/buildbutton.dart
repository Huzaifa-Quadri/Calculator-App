import 'package:calculator/buttondata.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({super.key, required this.bvalue, required this.onButtonPress});
  final String bvalue;

  final void Function(String valueb) onButtonPress;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
  
    return Container(                     //? Wrapping inside another conrtainer worked for me to add padding and configure button size.
      width: bvalue==Btn.n0?screenSize.width/2 : screenSize.width /4,
      height: screenSize.width / 4,
      padding: const EdgeInsets.all(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(screenSize.width / 2),
        onTap: (){onButtonPress(bvalue);},
        child: Container( 
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width / 1),
            border: Border.all(
              color: Colors.white, // White border color
              width: 2.0, // Adjust border width as needed
            ),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.onBackground.withOpacity(0.9),
              Theme.of(context).colorScheme.background.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            )
          ),
          child: Center(
            child: Text(
              bvalue,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

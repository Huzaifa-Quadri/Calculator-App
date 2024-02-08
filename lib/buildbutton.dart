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
          decoration: [Btn.clr, Btn.del].contains(bvalue)? BoxDecoration(                    //first color for clear and delete
            borderRadius: BorderRadius.circular(screenSize.width / 1),
            border: Border.all(
              color: Colors.white, // White border color
              width: 2.0, // Adjust border width as needed
            ),
//* Button Coloring Segment
            gradient: LinearGradient(colors: [
              const Color.fromARGB(175, 17, 16, 16).withOpacity(0.7),
              const Color.fromARGB(175, 17, 16, 16).withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            )
          ) : [Btn.add, Btn.subtract,Btn.multiply, Btn.divide, Btn.calculate, Btn.per].contains(bvalue) ? BoxDecoration(  //second color for operator buttons
            borderRadius: BorderRadius.circular(screenSize.width / 1),
            border: Border.all(
              color: Colors.white, // White border color
              width: 2.0, // Adjust border width as needed
            ),
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 255, 121, 12).withOpacity(0.9),
              const Color.fromARGB(255, 255, 115, 0).withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            )
          ) : BoxDecoration(                                          //Third color for All keys (Grey)
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
//* Button Coloring End
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

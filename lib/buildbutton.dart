import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({super.key, required this.bvalue});
  final String bvalue;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // return Container(
    //   // padding: const EdgeInsets.all(10),
    //   width: screenSize.width / 4,
    //   height: screenSize.width / 5,
    //   alignment: Alignment.center,
    //   child: InkWell(
    //     onTap: () {},
    //     // borderRadius: BorderRadius.circular(1000),
    //     // customBorder: CircleBorder(eccentricity: 1.0,side: BorderSide(color: Colors.white38)),
    //     child: Text(
    //       bvalue,
    //       style: const TextStyle(
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // );
    return InkWell(
      borderRadius: BorderRadius.circular(screenSize.width / 4),
      onTap: (){},
      child: Container(
        // margin: EdgeInsets.all(2),
        width: screenSize.width / 4,
        height: screenSize.width / 5,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenSize.width / 4),
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
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    }
}

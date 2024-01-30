import 'package:calculator/calculatorScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 219, 70, 25)),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

// class MyCalculator extends StatefulWidget {
//   const MyCalculator({super.key});
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   @override
//   State<MyCalculator> createState() => _MyCalcState();
// }

// class _MyCalcState extends State<MyCalculator> {
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     return Scaffold(
//       appBar: AppBar(
//         // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text(
//           "Calculator",
//           // style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 24),
//         ),
//       ),
//       body: GridView(
//                 gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio:3/2,
//                   crossAxisSpacing: 20,
//                   mainAxisExtent: 20,
//             ),
//           children:const [
//             Text("1", style: TextStyle(color: Colors.black),),
//             Text("1", style: TextStyle(color: Colors.black),),
//             Text("1", style: TextStyle(color: Colors.black),),
//             Text("1", style: TextStyle(color: Colors.black),),
//             Text("1", style: TextStyle(color: Colors.black),),
//             Text("1", style: TextStyle(color: Colors.black),),
//           ],  
//           ),

          
       
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class Containerfinal extends StatelessWidget {
//   const Containerfinal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     var possibleVerticalContainers =
//         List.generate((height ~/ 100), (index) => index);
//     var possibleHorizontalContainers =
//         List.generate(width ~/ 100, (index) => index);

//     var singleChild = SizedBox(
//       height: 100,
//       width: 100,
//       child: Container(
//         color: Colors.blue,
//         margin: EdgeInsets.all(5),
//         child: Center(
//           child: Icon(Icons.abc),
//         ),
//       ),
//     );
//     return Scaffold(
//       body: Column(
//         children: possibleVerticalContainers
//             .map(
//               (x) => Row(
//                 children: possibleHorizontalContainers
//                     .map((y) => singleChild)
//                     .toList(),
//               ),
//               // (x)=> Row(children: [Expanded(child: Container(height: 100, color: Colors.red ,child: Center(child: Text(x.toString()),),))],)
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// class ContainerfinalV2 extends StatelessWidget {
//   const ContainerfinalV2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size=MediaQuery.of(context).size;
//     var height=MediaQuery.of(context).size.height;
//     var width=MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(

//         children: [   
//            for(int i=0; i<(size.height~/100); i++)
//            Row(
//             children: [
             
//                 for(int j=0; j<size.width~/100; j++)
                   
//                   SizedBox(
//                    height:(j*10), 
//                     width: (j*10),
//                     child: Container(
//                       margin: EdgeInsets.all(3),
//                       color: Colors.brown,
//                     ),
                                    
//                   )
//             ],       
//            )
//         ],

//       ),
//     );
//   }
// }





// class ContainerfinalV2 extends StatelessWidget {
//   const ContainerfinalV2({super.key});

// @override
//   Widget build(BuildContext context) {
//     List<Widget> list = [];
//     int gridSize = 25;

//     double calculateDistance(int x1, int y1, int x2, int y2) {
//       int deltaX = x2 - x1;
//       int deltaY = y2 - y1;
//       return sqrt(deltaX * deltaX + deltaY * deltaY);
//     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
//     for (var i = 0; i < gridSize; i++) {
//       var currentRow = <Widget>[];
//       for (var j = 0; j < gridSize; j++) {
//         double distanceFromCenter = calculateDistance(i, j, 13, 13);

//         currentRow.add(SizedBox(
//           width: 40 - (distanceFromCenter * 2.1).abs(),
//           height: 40 - (distanceFromCenter * 2.1).abs(),
//           child: Container(
//             margin: EdgeInsets.all(3),
//             color: Colors.blue,
//           ),
//         ));
//       }
//       list.add(Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: currentRow,
//       ));
//     }

//     return Scaffold(
//       body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: list),
//     );
//   }
//   }

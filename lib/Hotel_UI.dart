import 'package:flutter/material.dart';

// class HotelUi extends StatelessWidget {
//   const HotelUi({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFf5f5f5),
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(Icons.arrow_back),
//             Text(
//               'Explore',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Icon(Icons.heart_broken),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 Icon(Icons.location_on_rounded),
//                 SizedBox(
//                   width: 10,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: MediaQuery.sizeOf(context).width - 100,
//                     height: 50,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: '  London',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         fillColor: Colors.white,
//                         filled: true,
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 2.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: BorderSide(
//                             color: Color(0xFF53d3c0),
//                             width: 2.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     width: 50,
//                     height: 50,
//                     child: InkWell(
//                       child: Icon(Icons.search_rounded, color: Colors.white,),
//                     ),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color(0xFF53d3c0),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: MediaQuery.sizeOf(context).width / 2 - 50,
//                   height: 100,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'Choose date',
//                         style: TextStyle(color: Colors.grey, fontSize: 15),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         '12 Dec - 22 Dec',
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF434345)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 2.0, // Line thickness
//                   height: 60.0, // Line height
//                   color: Colors.grey[350],
//                 ),
//                 Container(
//                   width: MediaQuery.sizeOf(context).width / 2 - 50,
//                   height: 100,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'Number of Rooms',
//                         style: TextStyle(color: Colors.grey, fontSize: 15),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         '1 Room - 2 Adults',
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF434345)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: MediaQuery.sizeOf(context).width - 50,
//                     height: 100,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           '530 hotels found',
//                           style:
//                               TextStyle(color: Color(0xFF404040), fontSize: 15),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               'Filters',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF434345)),
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Icon(
//                               Icons.density_medium_rounded,
//                               size: 20,
//                               color: Color(0xFF88d1c8),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               color: Colors.white,
//               width: MediaQuery.sizeOf(context).width,
//               child: Column(
//                 children: [
//                   Container(
//                     width: MediaQuery.sizeOf(context).width - 100,
//                     height: 286,
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(20),
//                         color: Colors.white),
//                     child: Column(
//                       children: [
//                         Card(
//                           elevation: 4,
//                           child: Image.asset(
//                             'assets/Images/hotel1.jpg',
//                             fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   'Grand Royal Hotel',
//                                   style: TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Wembley, London'),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Icon(Icons.location_on_rounded),
//                                     SizedBox(
//                                       width: 3,
//                                     ),
//                                     Text('2 Km to City')
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.grey,
//                                     ),
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                     Text('80 Reviews'),
//                                   ],
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   '\$180',
//                                   style: TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                                 Text('/per night'),
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 4,),
//                   Container(
//                     width: MediaQuery.sizeOf(context).width - 100,
//                     height: 282,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white
//                     ),
//                     child: Column(
//                       children: [
//                         Card(
//                           elevation: 4,
//                           child: Image.asset(
//                             'assets/Images/hotel2.jpg',
//                             fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   'Queen Hotel',
//                                   style: TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Wembley, London'),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Icon(Icons.location_on_rounded),
//                                     SizedBox(
//                                       width: 3,
//                                     ),
//                                     Text('2 Km to City')
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFF53d3c0),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.grey,
//                                     ),
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                     Text('80 Reviews'),
//                                   ],
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   '\$220',
//                                   style: TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                                 Text('/per night'),
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    double maxValue = 7;
    double days_in_dec = 31;
    return Scaffold(
      backgroundColor: Color(0xFFe1e1e1),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width - 100,
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFFe1e1e1)),
          ),
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Depart',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Mon 12 Dec',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width / 2 - 57,
                          height: 1,
                          color: Colors.grey[500],
                        )
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 87,
                      color: Colors.grey[500],
                    ),
                    Column(
                      children: [
                        Text(
                          'Return',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tue 22 Dec',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width / 2 - 57,
                          height: 1,
                          color: Colors.grey[400],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                  width: MediaQuery.sizeOf(context).width - 300,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width - 150,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.grey[600],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFe1e1e1),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Text(
                        'December',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.grey[600],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFe1e1e1),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width - 150,
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sun',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Mon',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Tue',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Wed',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Thu',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Fri',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Sat',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int j = 0; j < 7; j++)
                                  if (i * 7 + j + 1 <= days_in_dec)
                                    Text(
                                      '${i * 7 + j + 1}',
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.bold),
                                    )
                                  else
                                    Container(
                                      height: 20,
                                      width: 20,
                                    ),
                              ],
                            ),
                        ],
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

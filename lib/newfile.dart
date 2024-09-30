// import 'package:flutter/material.dart';

// class OverlayPortals extends StatefulWidget {
//   const OverlayPortals({super.key});

//   @override
//   State<OverlayPortals> createState() => _OverlayPortalState();
// }

// class _OverlayPortalState extends State<OverlayPortals> {
//   var overLayController1 = OverlayPortalController();
//   var overLayController2 = OverlayPortalController();
//   var overLayController3 = OverlayPortalController();

//    final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void _submit() {
//     String email = emailController.text;
//     String password = passwordController.text;

//     // Here you can add your authentication logic
//     print('Email: $email');
//     print('Password: $password');
//     // You would normally handle the login process here
//   }

//   // Function to build overlay portal
//   Widget _buildOverlayPortal(OverlayPortalController controller, Color color, IconData icon, String message, double bottomPosition) {
//     return OverlayPortal(
//       controller: controller,
//       overlayChildBuilder: (BuildContext context) {
//         return Positioned(
//           right: 20,
//           bottom: bottomPosition,
//           child: Container(
//             height: 60,
//             width: 300,
//             margin: EdgeInsets.all(10),
//             color: color,
//             child: Row(
//               children: [
//                 Padding(padding: EdgeInsets.all(10)),
//                 Icon(icon, color: Colors.white),
//                 Padding(padding: EdgeInsets.all(20)),
//                 Text(
//                   message,
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 Padding(padding: EdgeInsets.all(20)),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: Size(0, 0),
//                     backgroundColor: color,
//                   ),
//                   onPressed: controller.toggle,
//                   child: Center(child: Icon(Icons.close)),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(


//        appBar: AppBar(
//         title: Text('Login to Facebook'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _submit,
//               child: Text('Login'),
//               style: ElevatedButton.styleFrom(
//                 // primary: Colors.blue,
//                 // onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
//               ),
//             ),
//           ],
//         ),
//       ),


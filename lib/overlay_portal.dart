import 'package:flutter/material.dart';

class OverlayPortals extends StatefulWidget {
  const OverlayPortals({super.key});

  @override
  State<OverlayPortals> createState() => _OverlayPortalState();
}

class _OverlayPortalState extends State<OverlayPortals> {
  List<Widget> list=[];

  final overLayController1 = OverlayPortalController();
  final overLayController2 = OverlayPortalController();
  final overLayController3 = OverlayPortalController();

  Widget _buildOverlay(OverlayPortalController controller, Color color, IconData icon, String message, double bottom) {
    return OverlayPortal(
      controller: controller,
      overlayChildBuilder: (BuildContext context) {
        return Positioned(
          right: 20,
          bottom: bottom,
          child: Container(
            height: 60,
            width: 300,
            margin: const EdgeInsets.all(10),
            color: color,
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                Icon(icon, color: Colors.white),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(0, 0),
                    backgroundColor: color,
                  ),
                  onPressed: controller.toggle,
                  child: const Icon(Icons.close),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void submit(String text) {
    if (text == 'error') {
      overLayController2.toggle();
    } else if (text == 'successful') {
      overLayController1.toggle();
    } else {
      overLayController3.toggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOverlay(overLayController1, Colors.teal, Icons.check_circle, 'Successful', 30),
            _buildOverlay(overLayController2, Colors.red, Icons.warning, 'Create New Account',110),
            _buildOverlay(overLayController3, Colors.amber, Icons.warning, 'Invalid Input',200),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    submit('successful');
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    submit('error');
                  },
                  child: const Text(
                    'Forgot Account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

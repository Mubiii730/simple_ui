import 'package:flutter/material.dart';

class MyAppExample extends StatefulWidget {
  const MyAppExample({super.key});

  @override
  State<MyAppExample> createState() => _MyAppExampleState();
}

class _MyAppExampleState extends State<MyAppExample> {
  Widget mainContainer() {
    print('I am here');
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.grey,
            height: 400,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (j) {
                    return Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.all(10),
                      color: Colors.blue,
                    );
                  }),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStatefulWidget(mainContainer: mainContainer),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final Widget Function() mainContainer;

  const MyStatefulWidget({
    super.key,
    required this.mainContainer,
  });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget child = SizedBox();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                child = widget.mainContainer();
              });
            },
            child: const Text('Start'),
          ),
        ),
      ],
    );
  }
}










// class SecondStatefulWidget extends StatefulWidget {
//   final Function() onTapped;
//   const SecondStatefulWidget({super.key, required this.onTapped});

//   @override
//   State<SecondStatefulWidget> createState() => _SecondStatefulWidgetState();
// }

// class _SecondStatefulWidgetState extends State<SecondStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(

//     );
//   }
// }

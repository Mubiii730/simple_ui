import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful Widget Example')),
        body: Center(
          child: MyStatefulWidget(message: 'Hello, Flutter!', data:4 , new_fun: (x){
           int counter=x;
           print(counter);
           
          }),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
 final String message;
  final int data; 
  final Function new_fun;

  // Constructor to accept the parameter
  MyStatefulWidget({Key? key, required this.message, required this.data, required this.new_fun}) : super(key: key); // Key? key  and :super(key: key);  is optional here now but will be used later for some purposes;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String message_stateful='i am a stateful message';
  int _counter=0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }
 



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,


      children: [
        Text(widget.message, style: TextStyle(fontSize: 24), ),
        Text(widget.data.toString()),
        Text('Counter: $_counter'),
        ElevatedButton(onPressed: (){widget.new_fun(5);}, child: Text('Call Function ')),
        IncrementExample(CounterFun: _incrementCounter, message2: message_stateful, ),
        
        
        
       
      
      ],
    );
  }
}

class IncrementExample extends StatefulWidget {
  // const IncrementExample({super.key});
  final VoidCallback CounterFun;
  final String message2;
  IncrementExample({required this.CounterFun, required this.message2});

  @override
  State<IncrementExample> createState() => _IncrementExampleState();
}

class _IncrementExampleState extends State<IncrementExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        InkWell(onTap: widget.CounterFun, child: Text('Increment Counter')),
        Text(widget.message2.toString()),
      ],
    );
  }
}


// class IncrementExample extends StatelessWidget {
//   // const IncrementExample({super.key});
//   final VoidCallback CounterFun;

//   IncrementExample({required this.CounterFun});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(onPressed: CounterFun, child: Text('Increment Counter'));
//   }
// }

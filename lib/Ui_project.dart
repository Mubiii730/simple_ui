import 'package:flutter/material.dart';

class UiProject extends StatelessWidget {
  const UiProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6ede4),
      appBar: AppBar(
        title: Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width - 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  
                  child: Icon(Icons.chevron_left, size: 40,),
                ),
                Text(
                  'Skip',
                  style: TextStyle(color: Color(0xFF46465b), fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFFf6ede4),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 450,
                child: Column(
                  children: [
                    Text(
                      'Relax',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 300,
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore', style: TextStyle(),textAlign: TextAlign.center,)),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset('assets/Images/project1.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? Color(0xFF172437)
                                        : Colors.grey,
                                    shape: BoxShape.circle),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF172437),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => secondPage()));
                          },
                          icon: Center(
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 50,
                              color: Colors.white,
                              
                              
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class secondPage extends StatelessWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6ede4),
      body: Center(
        child: Container(
          width: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 450,
                height: 350,
                child: Image.asset('assets/Images/project2.png'),
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 250,
                child:
                    Center(child: Text('Stay Organised and live stress-free with you-do app',textAlign: TextAlign.center,)),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xFF172437),
                    width: 2,
                  ),
                  color: Color(0xFF172437),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    Text(
                      ' Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

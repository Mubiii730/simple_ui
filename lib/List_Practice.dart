import 'package:flutter/material.dart';

class listPractice extends StatelessWidget {
  const listPractice({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    var possibleHorizontalContainers=List.generate(width~/100, (index)=>index);
    var possibleVerticalContainers=List.generate(height~/100, (index)=>index);

    var singleChild= SizedBox(
            width: 100,
            height: 100,
            
     
         child:  Container(
            margin: EdgeInsets.all(3),
            color: Colors.blue,
            
          )
        
      
    );



    return Scaffold(
      body: Column(
        
        children: 
           
           possibleVerticalContainers.map(
           
            (x)=>Row(
              children:possibleHorizontalContainers.map(
                (y)=>singleChild,
                 

              ).toList(),
            )
        
        ).toList(),

        ),
    );
  }
}
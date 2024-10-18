import 'package:flutter/material.dart';

class MapExample extends StatelessWidget {
  const MapExample({super.key});
  
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData={
    'name': 'ali',
    'age': 23,
    'colors':[
      {
        'green':['light-green', 'dark-green'],
        'address':{
          'city':'jhelum',
          'postcode': 49600,
          'fav-city':['jhelum', 'lahore', 'isb']
        }
      },
      {
        'color':'green'
      }
    ]
  };
    return Scaffold(
      body: Column(
        children: [

          Text('${userData}'),
          Text('${userData['name']}'),
          Text('${userData['age']}'),
          Text('${userData['colors']}'),
          Text('${userData['colors'][0]}'),
          Text('${userData['colors'][0]['green']}'),
          Text('${userData['colors'][0]['green'][0]}'),
          Text('${userData['colors'][0]['green'][1]}'),
          Text('${userData['colors'][0]['address']['city']}'),
          Text('${userData['colors'][0]['address']['postcode']}'),
          Text('${userData['colors'][0]['address']['fav-city']}'),
          Text('${userData['colors'][0]['address']['fav-city'][0]}'),
          Text('${userData['colors'][0]['address']['fav-city'][1]}'),
          Text('${userData['colors'][0]['address']['fav-city'][2]}'),

          Text('${userData['colors'][1]}'),
          Text('${userData['colors'][1]['color']}'),





        ],
      ),
    );
  }
}
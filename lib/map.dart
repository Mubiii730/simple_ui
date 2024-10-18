import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MapExample extends StatelessWidget {
  final List<Map<String, String>> countriesData = [
    {"country": 'India', 'capital': 'New Delhi'},
    {'country': 'USA', 'capital': 'Washington D.C'},
    {'country': 'Canada', 'capital': 'Ottawa'},
    {'country': 'Germany', 'capital': 'Berlin'},
    {"country": "France", "capital": "Paris"},
    {"country": "Japan", "capital": "Tokyo"},
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.green, // Set your desired status bar color here
        statusBarIconBrightness: Brightness.light, // For light icons
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Set AppBar color to green
        title: Text('map() Method Example'),
      ),
      body: ListView(
        children: countriesData.map((x) {
          final String? country = x['country'];
          final String? capital = x['capital'];

          return Container(
            child: ListTile(
              title: Text(
                country!,
                style: TextStyle(color: Colors.red),
              ),
              subtitle: Text('Capital: $capital'),
            ),
          );
        }).toList(),
      ),
    );
  }
}

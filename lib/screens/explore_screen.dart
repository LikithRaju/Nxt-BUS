// lib/screens/explore_screen.dart
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final List<Map<String, String>> places = [
    {'name': 'Taj Mahal', 'type': 'Historic', 'route': 'Delhi-Agra'},
    {'name': 'Goa Beach', 'type': 'Adventure', 'route': 'Pune-Goa'},
    // ...more places
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore Destinations')),
      body: ListView(
        children: places.map((place) => Card(
          child: ListTile(
            title: Text(place['name']!),
            subtitle: Text('${place['type']} • ${place['route']}'),
            trailing: Icon(Icons.directions_bus),
          ),
        )).toList(),
      ),
    );
  }
}
// lib/screens/explore_screen.dart
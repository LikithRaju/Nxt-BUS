// lib/screens/admin_dashboard.dart
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  final List<Map<String, String>> buses = [
    {'number': 'KA01AB1234', 'type': 'Sleeper', 'capacity': '40'},
    // ... more
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: ListView(
        children: buses.map((bus) => Card(
          child: ListTile(
            title: Text('Bus ${bus['number']}'),
            subtitle: Text('${bus['type']} • Capacity: ${bus['capacity']}'),
            trailing: Icon(Icons.edit),
          ),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new bus action
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
// lib/screens/admin_dashboard.dart end
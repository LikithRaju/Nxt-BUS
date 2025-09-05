// lib/screens/help_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelpScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Help & Support')),
      body: Column(
        children: [
          Expanded(child: FAQChatWidget()),
        ],
      ),
    );
  }
}

// lib/widgets/faq_chat_widget.dart
import 'package:flutter/material.dart';

class FAQChatWidget extends StatefulWidget {
  @override
  State<FAQChatWidget> createState() => _FAQChatWidgetState();
}

class _FAQChatWidgetState extends State<FAQChatWidget> {
  final List<Map<String, String>> faq = [
    {'Q': 'Payment not working?', 'A': 'Try another gateway or contact support.'},
    // ... more FAQ pairs
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faq.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.chat_bubble_outline),
        title: Text(faq[i]['Q'] ?? ''),
        subtitle: Text(faq[i]['A'] ?? ''),
      ),
    );
  }
}

// lib/widgets/faq_chat_widget.dart
import 'package:flutter/material.dart';

class FAQChatWidget extends StatefulWidget {
  const FAQChatWidget({Key? key}) : super(key: key);

  @override
  State<FAQChatWidget> createState() => _FAQChatWidgetState();
}

class _FAQChatWidgetState extends State<FAQChatWidget> {
  final TextEditingController _controller = TextEditingController();

  // Example FAQs
  final List<Map<String, String>> _faqList = [
    {
      'Q': 'How do I book a bus ticket?',
      'A': 'Use the search box on the home page to choose origin, destination, and date, then tap "Search Buses".'
    },
    {
      'Q': 'How do I pay for a ticket?',
      'A': 'You can use Razorpay, PhonePe, Google Pay, or NxT Bus Wallet for secure payments.'
    },
    {
      'Q': 'Can I cancel a booking?',
      'A': 'Yes, go to "My Bookings", select the booking, and press "Cancel". Refunds are processed as per policy.'
    },
    {
      'Q': 'How do I get festival offers?',
      'A': 'Festival offers are shown in the "Offers Zone" and "Festival Calendar" on the home page during festival dates.'
    }
    // ... add more as desired
  ];

  // User chat history (question/answer pairs)
  final List<Map<String, String>> _chatHistory = [];

  void _submitQuestion() {
    final question = _controller.text.trim();
    if (question.isEmpty) return;

    // Lookup FAQ answer or give a default response
    String? answer;
    for (final item in _faqList) {
      if (question.toLowerCase().contains(item['Q']!.toLowerCase().split(' ').first)) {
        answer = item['A'];
        break;
      }
    }
    answer ??= 'Thanks for your question. Our support team will assist you shortly.';

    setState(() {
      _chatHistory.add({'Q': question, 'A': answer!});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FAQ Suggestions (above chat input)
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Frequently Asked Questions:', style: Theme.of(context).textTheme.titleMedium),
              ..._faqList.map((faq) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text(faq['Q'] ?? ''),
                  subtitle: Text(faq['A'] ?? ''),
                  tileColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              )),
              const Divider(height: 24),
              Text('Ask Your Question:', style: Theme.of(context).textTheme.titleMedium),
              ..._chatHistory.reversed.map((chat) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text('You: ${chat['Q']}', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Reply: ${chat['A']}'),
                ],
              )),
            ],
          ),
        ),
        // Chat Input
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Type your question...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onSubmitted: (_) => _submitQuestion(),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: _submitQuestion,
                icon: const Icon(Icons.send),
                label: const Text('Send'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// lib/widgets/faq_chat_widget.dart end
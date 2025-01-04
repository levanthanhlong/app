import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  static const routeName = "/helpSupport";

  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Introduction
              const Text(
                'How can we help you?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Browse through the FAQs or contact us for support.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Section: FAQ
              const Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              const ExpansionTile(
                title: Text('How can I contact support?'),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'You can contact support via email at umntk0001@gmail.com or by calling our hotline at 0388446254',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Section: Contact Support
              const Text(
                'Contact Support',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.blue),
                  title: const Text('Email Us'),
                  subtitle: const Text('umntk0001@gmail.com'),
                  onTap: () {
                    // Handle email link
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: const Icon(Icons.phone, color: Colors.green),
                  title: const Text('Call Us'),
                  subtitle: const Text('0388446254'),
                  onTap: () {
                    // Handle phone call
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: const Icon(Icons.chat, color: Colors.orange),
                  title: const Text('Chat with Us'),
                  subtitle: const Text('Available 24/7'),
                  onTap: () {
                    // Navigate to chat feature
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

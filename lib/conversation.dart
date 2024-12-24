import 'package:flutter/material.dart';

class Conversation extends StatelessWidget {
  const Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alex"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            spacing: 16.0,
            children: [
              const SizedBox(height: 12.0),
              Text("Conversation with Alex appears here..."),
            ],
          ),
        ),
      ),
    );
  }
}

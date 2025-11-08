import 'package:flutter/material.dart';

class DrinkListScreen extends StatelessWidget {
  const DrinkListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drink Log')),
      body: const Center(child: Text('Drink List Screen')),
    );
  }
}

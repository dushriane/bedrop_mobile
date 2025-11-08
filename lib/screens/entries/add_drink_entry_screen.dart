import 'package:flutter/material.dart';

class AddDrinkEntryScreen extends StatelessWidget {
  const AddDrinkEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Drink Entry')),
      body: const Center(child: Text('Add Drink Entry Screen')),
    );
  }
}

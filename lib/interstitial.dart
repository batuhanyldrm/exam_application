import 'package:flutter/material.dart';

class Interstitial extends StatelessWidget {
  const Interstitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interstitial'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Completed Quiz'),
        ),
      ),
    );
  }
}

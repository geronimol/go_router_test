import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1'), backgroundColor: Colors.green),
      body: ElevatedButton(
        onPressed: () => context.goNamed('/page2'),
        child: const Text('Page 2'),
      ),
    );
  }
}

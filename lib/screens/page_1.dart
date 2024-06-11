import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(onPressed: () => context.go('/page2'), child: const Text('Page 2')),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => context.pop(), child: const Text('Back(pop)')),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => context.go('/'), child: const Text('Back(go)')),

            ],
          ),
        ),
      ),
    );
  }
}

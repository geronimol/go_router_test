import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(onPressed: () => context.go('/page1'), child: const Text('Page 1')),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => context.go('/page2'), child: const Text('Page 2')),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => context.go('/page3'), child: const Text('Page 3')),
            ],
          ),
        ),
      ),
    );
  }
}

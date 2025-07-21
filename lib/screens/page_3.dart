import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3'), backgroundColor: Colors.blue),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(onPressed: () => context.pop(), child: const Text('Back(pop)')),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => context.goNamed('/page2'), child: const Text('Back(go Page 2)')),
            ],
          ),
        ),
      ),
    );
  }
}

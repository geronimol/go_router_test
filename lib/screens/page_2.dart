import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2'), backgroundColor: Colors.yellow),
      body: Column(
        children: [
          const Text('The only way to go to Page 3 should be by clicking the button below!'),
          ElevatedButton(
            onPressed: () => context.goNamed('/page3', extra: Object()),
            child: const Text('Page 3'),
          ),
        ],
      ),
    );
  }
}

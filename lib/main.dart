import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'screens/home_page.dart';
import 'screens/page_1.dart';
import 'screens/page_2.dart';
import 'screens/page_3.dart';
import 'screens/page_4.dart';

void main() {
  /// Remove the "#" from web paths
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Test',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            name: '/',
            path: '/',
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: '/page1',
                path: '/page1',
                builder: (context, state) => const Page1(),
                routes: [
                  GoRoute(
                    name: '/page2',
                    path: '/page2',
                    builder: (context, state) => const Page2(),
                    routes: [
                      GoRoute(
                        name: '/page3',
                        path: '/page3',
                        redirect: (context, state) {
                          if (state.extra == null) {
                            return '/page1';
                          }
                        },
                        builder: (context, state) => const Page3(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: ElevatedButton(onPressed: () => context.go('/page1'), child: const Text('Page 1')),
    );
  }
}

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
            onPressed: () => context.goNamed(
              '/page3',
              extra: Object(),
            ),
            child: const Text('Page 3'),
          ),
        ],
      ),
    );
  }
}

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
              ElevatedButton(onPressed: () => context.goNamed('/page2'), child: const Text('Back(go Page 2)')),
            ],
          ),
        ),
      ),
    );
  }
}

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                path: 'page3',
                builder: (context, state) => const Page3(),
              ),
              GoRoute(
                path: 'page4',
                builder: (context, state) => const Page4(),
              ),
            ],
          ),
          GoRoute(
            path: '/page1',
            builder: (context, state) => const Page1(),
          ),
          GoRoute(
            path: '/page2',
            builder: (context, state) => const Page2(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'catsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//

      debugShowCheckedModeBanner: false,
      initialRoute: '/cats',

      routes: {
        '/cats': (context) => const catsPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'screens/cats_page.dart';
import 'constants/enviroment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Enviroment.initEnviroment();
  runApp(const ProviderScope(child: MyApp()));
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
        '/cats': (context) => const CatsPage(),
      },
    );
  }
}

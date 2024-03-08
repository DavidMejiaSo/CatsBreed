import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/landing_page.dart';
import 'constants/enviroment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Enviroment.initEnviroment();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Bloquea la orientación vertical
    // Agrega otras orientaciones que desees bloquear
  ]);
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

import 'package:dam_proyecto_final/pages/home.dart';
import 'package:dam_proyecto_final/pages/infogeneral.dart';
import 'package:dam_proyecto_final/pages/iniciosecion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),initialRoute: '/',
    routes: {
      '/': (context) => const Home(idReceta: ''),

      '/infoGeneral': (context) => const InfoGeneral(),
    }
    );
  }
}

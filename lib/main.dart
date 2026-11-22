import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fifund/routes/router.dart';

import 'firebase_options.dart';

Future<void> main() async{    // initialize firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('Firebase initialized successfully');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FiFund',
      routerConfig: router,

    );
  }
}


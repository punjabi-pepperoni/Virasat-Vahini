import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'core/utils/theme.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'injection_container.dart' as di;
// import 'firebase_options.dart'; // Uncomment this when you add the file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // TODO: Initialize Firebase here once google-services.json is added
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virasat Vahini',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashPage(),
    );
  }
}

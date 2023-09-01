import 'package:apls/view/screen/SignUpScreen.dart';
import 'package:apls/view/screen/SplachScreen.dart';
import 'package:apls/view/screen/WebViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplachScreen(),
        '/SignUp': (context) => SignUpScreen(),
        '/WebPage': (context) => WebViewScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

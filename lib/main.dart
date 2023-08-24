import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/providers/data_provider.dart';
import 'package:timer_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => DataProvider(),
        child: const HomeScreen(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:frequency/screens/login.dart';
import 'package:frequency/screens/register_user.dart';

void main() {
  runApp(const Frequency());
}

class Frequency extends StatelessWidget {
  const Frequency({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frequency',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(title: 'Frequency'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RegisterUser());
  }
}

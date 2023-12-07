import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_bloc.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/data/auth_repository.dart';
import 'package:frequency/data/firestore_repository.dart';
import 'package:frequency/firebase_options.dart';
import 'package:frequency/screens/about_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC-T2XiZYWahv_cjBep2XBwjTa34IKwmPk",
      appId: "1:945959392660:android:7be44b1ef2f7160e236b81",
      messagingSenderId: "messaging id",
      projectId: "frequency-b2fe4",
    ),
  );
  runApp(const Frequency());
}

class Frequency extends StatelessWidget {
  const Frequency({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository()),
        RepositoryProvider<FirestoreRepository>(
            create: (context) => FirestoreRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
                dbRepository:
                    RepositoryProvider.of<FirestoreRepository>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Frequency',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(title: 'Frequency'),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return RepositoryProvider(
  //     create: (context) => AuthRepository(),
  //     child: BlocProvider(
  //       create: (context) => AuthBloc(
  //           authRepository: RepositoryProvider.of<AuthRepository>(context)),
  //       child: MaterialApp(
  //         title: 'Frequency',
  //         theme: ThemeData(
  //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //           useMaterial3: true,
  //         ),
  //         home: const Home(title: 'Frequency'),
  //       ),
  //     ),
  //   );
  // }
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
    return const Scaffold(body: AboutApp());
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_bloc.dart';
import 'package:frequency/bloc/course/course_bloc.dart';
import 'package:frequency/bloc/discipline/discipline_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_bloc.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/data/auth_repository.dart';
import 'package:frequency/data/firestore_repository.dart';
import 'package:frequency/screens/about_app.dart';
import 'package:intl/date_symbol_data_local.dart';

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
  await initializeDateFormatting('pt_BR', null);

  runApp(const Frequency());
}

class Frequency extends StatelessWidget {
  const Frequency({super.key});

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
          BlocProvider<CourseBloc>(
            create: (context) => CourseBloc(
                dbRepository:
                    RepositoryProvider.of<FirestoreRepository>(context)),
          ),
          BlocProvider<DisciplineBloc>(
            create: (context) => DisciplineBloc(
                dbRepository:
                    RepositoryProvider.of<FirestoreRepository>(context)),
          ),
          BlocProvider<FrequencyBloc>(
            create: (context) => FrequencyBloc(
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

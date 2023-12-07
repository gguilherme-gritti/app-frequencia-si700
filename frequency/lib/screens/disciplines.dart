import 'package:flutter/material.dart';
import 'package:frequency/screens/register_discipline.dart';
import 'package:frequency/widgets/disciplines_list.dart';

class Disciplines extends StatelessWidget {
  const Disciplines();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4157ff),
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              const Icon(
                Icons.add_card,
                color: Colors.white,
                size: 50,
              ),
              const SizedBox(height: 10),
              const Text(
                'Disciplinas',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Color(0xffeeeeff),
                  ),
                  child: const DisciplinesListView(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RegisterDiscipline()));
          },
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF4157ff),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

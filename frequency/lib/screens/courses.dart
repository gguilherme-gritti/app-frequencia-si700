import 'package:flutter/material.dart';
import 'package:frequency/screens/home_frequency.dart';
import 'package:frequency/screens/register_course.dart';
import 'package:frequency/screens/register_discipline.dart';
import 'package:frequency/widgets/courses_list_view.dart';
import 'package:frequency/widgets/disciplines_list.dart';

class Courses extends StatelessWidget {
  const Courses();

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
                'Cursos',
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
                  child: const CoursesListView(),
                ),
              ),
              back(context)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RegisterCourse()));
          },
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF4157ff),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget back(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HomeFrequency()));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: const Color(0xFF4157ff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      child: const Text('Voltar',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: 'Poppins')),
    );
  }
}

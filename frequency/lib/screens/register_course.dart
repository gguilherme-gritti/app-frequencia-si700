import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_bloc.dart';
import 'package:frequency/bloc/auth/auth_state.dart';
import 'package:frequency/bloc/course/course_bloc.dart';
import 'package:frequency/bloc/course/course_event.dart';
import 'package:frequency/bloc/course/course_state.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/course_data.dart';
import 'package:frequency/screens/courses.dart';
import 'package:frequency/screens/home_frequency.dart';
import 'package:frequency/screens/login.dart';

class RegisterCourse extends StatefulWidget {
  const RegisterCourse({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterCourseState();
  }
}

class RegisterCourseState extends State<RegisterCourse> {
  final CourseDataModel courseData = CourseDataModel(
    code: "",
    description: "",
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4157ff),
        body: BlocListener<CourseBloc, CourseState>(
          listener: (context, state) => {
            if (state is CourseError)
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.msg,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'Poppins'),
                  ),
                  backgroundColor: Colors.red,
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {},
                  ),
                ))
              }
            else if (state is RegisteredCourse)
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Curso Cadastrado com sucesso!',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {},
                  ),
                )),
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const Login()))
              }
          },
          child: Center(
            child:
                BlocBuilder<CourseBloc, CourseState>(builder: (context, state) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/img/course.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Text(
                    'Cadastro de Curso',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Por favor, preencha os campos abaixo',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 40),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(children: [
                          codeField(),
                          const SizedBox(height: 15),
                          descriptionField(),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              cancelButton(),
                              const SizedBox(width: 15),
                              registerButton(context, state)
                            ],
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget codeField() {
    return TextFormField(
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira um Codigo Válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        courseData.code = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Código',
          labelStyle: TextStyle(fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black12)),
          filled: true,
          fillColor: Colors.white),
    );
  }

  Widget descriptionField() {
    return TextFormField(
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira uma descrição válida";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        courseData.description = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Descrição',
          labelStyle: TextStyle(fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black12)),
          filled: true,
          fillColor: Colors.white),
    );
  }

  Widget cancelButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: const Color(0xFFffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: const Text('Cancelar',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: 'Poppins')),
      ),
    );
  }

  Widget registerButton(BuildContext buildContext, CourseState state) {
    Widget buttonChild = const Text(
      'Cadastrar',
      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
    );

    if (state is LoadingCourse) {
      if (state.load) {
        buttonChild = const CircularProgressIndicator();
      }
    }

    return BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
      var userId = "";
      if (userState is UserData) {
        userId = userState.user.id;
      }

      return Expanded(
        child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                buildContext
                    .read<CourseBloc>()
                    .add(AddCourseRequested(courseData, userId));
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => const Courses()));
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              backgroundColor: const Color(0xFF4157ff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            child: buttonChild),
      );
    });
  }
}

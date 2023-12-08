import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_state.dart';
import 'package:frequency/bloc/course/course_bloc.dart';
import 'package:frequency/bloc/course/course_event.dart';
import 'package:frequency/bloc/course/course_state.dart';
import 'package:frequency/bloc/discipline/discipline_bloc.dart';
import 'package:frequency/bloc/discipline/discipline_event.dart';
import 'package:frequency/bloc/discipline/discipline_state.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/discipline_data.dart';
import 'package:frequency/model/firebase/user_data.dart';
import 'package:frequency/screens/home_frequency.dart';
import 'package:frequency/screens/login.dart';

class RegisterDiscipline extends StatefulWidget {
  const RegisterDiscipline({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterDisciplineState();
  }
}

class RegisterDisciplineState extends State<RegisterDiscipline> {
  late UserBloc userBloc;

  late CourseBloc courseBloc;

  @override
  void initState() {
    super.initState();

    userBloc = BlocProvider.of<UserBloc>(context);
    UserState currentState = userBloc.state;

    if (currentState is UserData) {
      UserDataModel userData = currentState.user;

      courseBloc = BlocProvider.of<CourseBloc>(context);

      courseBloc.add(GetCoursesRequested(userData.id));
    }
  }

  final DisciplineDataModel disciplineData = DisciplineDataModel(
      code: "",
      description: "",
      course_id: "",
      initial_hour: "",
      final_hour: "",
      week_day: "");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4157ff),
        body: BlocListener<DisciplineBloc, DisciplineState>(
          listener: (context, state) => {
            if (state is AuthError)
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Erro',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                  backgroundColor: Colors.red,
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {},
                  ),
                ))
              }
            else if (state is Registered)
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Disciplina Cadastrada com sucesso!',
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
            child: BlocBuilder<DisciplineBloc, DisciplineState>(
                builder: (context, state) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/img/discipline.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Text(
                    'Cadastro de Disciplina',
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
                          CourseDropdown(onCourseSelected:
                              (Map<String, dynamic>? selectedCourse) {
                            if (selectedCourse != null) {
                              disciplineData.course_id = selectedCourse['id'];
                              print("Curso selecionado: $selectedCourse");
                            } else {
                              print("Nenhum curso selecionado");
                            }
                          }),
                          const SizedBox(height: 15),
                          codeField(),
                          const SizedBox(height: 15),
                          descriptionField(),
                          const SizedBox(height: 15),
                          weekDay(),
                          const SizedBox(height: 15),
                          initialHour(),
                          const SizedBox(height: 15),
                          finalHour(),
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
        disciplineData.code = value ?? "";
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
        disciplineData.description = value ?? "";
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

  Widget weekDay() {
    return TextFormField(
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira um dia da semana Válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        disciplineData.week_day = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Dia da Semana',
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

  Widget initialHour() {
    return TextFormField(
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira uma Hora Válida";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        disciplineData.initial_hour = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Hora de inicio da aula',
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

  Widget finalHour() {
    return TextFormField(
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira uma Hora Válida";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        disciplineData.final_hour = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Hora de fim da aula',
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

  Widget registerButton(BuildContext buildContext, DisciplineState state) {
    Widget buttonChild = const Text(
      'Cadastrar',
      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
    );

    if (state is LoadingDiscipline) {
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
                    .read<DisciplineBloc>()
                    .add(AddDisciplineRequested(disciplineData, userId));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomeFrequency()));
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

class CourseDropdown extends StatefulWidget {
  final Function(Map<String, dynamic>?) onCourseSelected;

  const CourseDropdown({Key? key, required this.onCourseSelected})
      : super(key: key);

  @override
  _CourseDropdownState createState() => _CourseDropdownState();
}

class _CourseDropdownState extends State<CourseDropdown> {
  List<Map<String, dynamic>> items = [
    {'id': '', 'code': ''},
  ];

  Map<String, dynamic>? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(builder: (context, state) {
      if (state is CoursesList) {
        items = state.courses;
      }

      return Column(
        children: [
          Container(
            width: double.infinity, // Define a largura como 100%
            child: DropdownButton<Map<String, dynamic>>(
              value: selectedOption,
              items: items.map((item) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: item,
                  child: Text(item['code']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                  widget.onCourseSelected(selectedOption);
                });
              },
            ),
          ),
        ],
      );
    });
  }
}

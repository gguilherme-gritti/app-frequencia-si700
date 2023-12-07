import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_bloc.dart';
import 'package:frequency/bloc/auth/auth_event.dart';
import 'package:frequency/bloc/auth/auth_state.dart';
import 'package:frequency/bloc/course/course_bloc.dart';
import 'package:frequency/bloc/course/course_event.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_event.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/course_data.dart';
import 'package:frequency/model/firebase/discipline_data.dart';
import 'package:frequency/model/firebase/user_data.dart';
import 'package:frequency/screens/login.dart';

class RegisterDiscipline extends StatefulWidget {
  const RegisterDiscipline({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterDisciplineState();
  }
}

class RegisterDisciplineState extends State<RegisterDiscipline> {
  late UserBloc
      userBloc; // Declare uma variável para armazenar a instância do seu BLoC

  @override
  void initState() {
    super.initState();

    userBloc = BlocProvider.of<UserBloc>(context);
    UserState currentState = userBloc.state;

    if (currentState is UserData) {
      UserDataModel userData = currentState.user;
      print(userData.id);
    }
  }

  final DisciplineDataModel disciplineData = DisciplineDataModel(
      code: "",
      description: "",
      user_email: "",
      course_code: "",
      initial_hour: "",
      final_hour: "",
      week_day: "");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4157ff),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) => {
            if (state is AuthError)
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
            child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
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
                          courseTest(),
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

  Widget course() {
    return TextFormField(
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira um Curso Válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        disciplineData.course_code = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Código do Curso',
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

  Widget courseTest() {
    // Lista de opções para o dropdown
    List<String> options = ['', 'Opção 1', 'Opção 2', 'Opção 3'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: disciplineData.course_code,
          onChanged: (String? newValue) {
            setState(() {
              disciplineData.course_code = newValue!;
            });
          },
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),
      ],
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

  Widget registerButton(BuildContext buildContext, AuthState state) {
    Widget buttonChild = const Text(
      'Cadastrar',
      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
    );

    if (state is Loading) {
      if (state.load) {
        buttonChild = const CircularProgressIndicator();
      }
    }

    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              // buildContext
              //     .read<AuthBloc>()
              //     .add(SignUpRequested(disciplineData.email, disciplineData.password));
              // buildContext.read<UserBloc>().add(AddUserRequested(disciplineData));
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
  }
}

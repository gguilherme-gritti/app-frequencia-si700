import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_bloc.dart';
import 'package:frequency/bloc/auth/auth_event.dart';
import 'package:frequency/bloc/auth/auth_state.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_event.dart';
import 'package:frequency/model/login_data.dart';
import 'package:frequency/screens/home_frequency.dart';
import 'package:frequency/screens/register_user.dart';
import 'package:frequency/widgets/text_divider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final LoginData loginData = LoginData(email: "", password: "");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffeeeeff),
        body: Center(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) => {
              if (state is Authenticated)
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const HomeFrequency(name: 'Guilherme')))
                }
              else if (state is AuthError)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.msg,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                    action: SnackBarAction(
                      label: 'Fechar',
                      onPressed: () {},
                    ),
                  ))
                }
            },
            child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 35, bottom: 30),
                    width: 120.0,
                    height: 120.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/assets/img/logo.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: const Column(
                      children: [
                        Text(
                          'FrequencYou',
                          style: TextStyle(
                              fontSize: 28.0,
                              color: Color(0xFF4157ff),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Controle de Frequência rapido e prático!',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: 'Poppins'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          emailField(),
                          const SizedBox(height: 20),
                          passwordField(),
                          const SizedBox(height: 40),
                          enterButton(context, state),
                          const SizedBox(height: 20),
                          const TextDivider(text: 'ou'),
                          const SizedBox(height: 20),
                          registerButton()
                        ],
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

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (String? value) {},
      onSaved: (String? value) {
        loginData.email = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Email',
          icon: Icon(Icons.email),
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

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: (String? value) {},
      onSaved: (String? value) {
        loginData.password = value ?? "";
      },
      decoration: const InputDecoration(
        labelText: 'Senha',
        icon: Icon(Icons.lock),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget enterButton(BuildContext buildContext, AuthState state) {
    Widget buttonChild = const Text(
      'Entrar',
      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
    );

    if (state is Loading) {
      if (state.load) {
        buttonChild = const CircularProgressIndicator();
      }
    }
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            formKey.currentState!.save();
            if (!loginData.validForm(loginData)) {
              //to do verify snackbar
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text(
                  'Formulário de Login Inválido!',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Fechar',
                  onPressed: () {},
                ),
              ));
            } else {
              buildContext
                  .read<AuthBloc>()
                  .add(SignInRequested(loginData.email, loginData.password));
              buildContext
                  .read<UserBloc>()
                  .add(GetUserRequested(loginData.email));
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

  Widget registerButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const RegisterUser()));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: const Color(0xFFffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: const Text(
          'Registre-se',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}

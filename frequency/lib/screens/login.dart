import 'package:flutter/material.dart';
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
  final LoginData loginData = LoginData(ra: "", password: "");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffeeeeff),
        body: Center(
          child: Column(
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
                      raField(),
                      const SizedBox(height: 20),
                      passwordField(),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.save();
                            if (!loginData.validForm(loginData)) {
                              final snackBar = SnackBar(
                                content:
                                    const Text('Formulário de Login Inválido!'),
                                action: SnackBarAction(
                                  label: 'Fechar',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const HomeFrequency()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                            backgroundColor: const Color(0xFF4157ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child: const Text(
                            'Entrar',
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TextDivider(text: 'ou'),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const RegisterUser()));
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
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget raField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (String? value) {},
      onSaved: (String? value) {
        loginData.ra = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'RA',
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
}

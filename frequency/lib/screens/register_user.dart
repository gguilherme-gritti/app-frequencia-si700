import 'package:flutter/material.dart';
import 'package:frequency/model/register_user_data.dart';
import 'package:frequency/screens/home_frequency.dart';
import 'package:frequency/screens/login.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterUserState();
  }
}

class RegisterUserState extends State<RegisterUser> {
  final RegisterUserData registerUserData =
      RegisterUserData(ra: "", email: "", name: "", password: "");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4157ff),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/img/register.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Text(
                'Cadastro',
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
                    fontSize: 16, color: Colors.white60, fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
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
                      raField(),
                      const SizedBox(height: 15),
                      emailField(),
                      const SizedBox(height: 15),
                      nameField(),
                      const SizedBox(height: 15),
                      passwordField(),
                      const SizedBox(height: 15),
                      confirmPasswordField(),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          cancelButton(),
                          const SizedBox(width: 15),
                          registerButton()
                        ],
                      )
                    ]),
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
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty || value.length != 6) {
            return "Insira um RA Válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        registerUserData.ra = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'RA',
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

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira um email válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        registerUserData.email = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Email',
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

  Widget nameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira um nome válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        registerUserData.name = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Nome',
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

  Widget passwordField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira uma Senha";
          }

          if (value != registerUserData.confirmPassword) {
            return "Senhas não coincidem";
          }
        }
      },
      onChanged: (String? value) {
        setState(() {
          registerUserData.password = value ?? "";
        });
      },
      onSaved: (String? value) {
        registerUserData.password = value ?? "";
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Senha',
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
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

  Widget confirmPasswordField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira uma Senha";
          }

          if (value != registerUserData.password) {
            return "Senhas não coincidem";
          }
        }
      },
      onChanged: (String? value) {
        setState(() {
          registerUserData.confirmPassword = value ?? "";
        });
      },
      onSaved: (String? value) {
        registerUserData.confirmPassword = value ?? "";
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Confirme sua senha',
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
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
            style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }

  Widget registerButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => HomeFrequency(
                      name: registerUserData.name,
                    )));
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
          'Cadastrar',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

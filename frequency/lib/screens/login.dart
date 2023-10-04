import 'package:flutter/material.dart';
import 'package:frequency/widgets/text_divider.dart';

class Login extends StatelessWidget {
  const Login();

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
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'RA',
                          icon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.black12)),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
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
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 60),
                          backgroundColor: const Color(0xFF4157ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextDivider(text: 'ou'),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

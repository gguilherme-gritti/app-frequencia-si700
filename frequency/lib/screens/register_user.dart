import 'package:flutter/material.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser();

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
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Por favor, preencha os campos abaixo',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                ),
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
                  child: Column(children: [
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'RA',
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
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
                    const SizedBox(height: 15),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
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
                    const SizedBox(height: 15),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
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
                    const SizedBox(height: 15),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
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
                    ),
                    const SizedBox(height: 15),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
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
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              backgroundColor: const Color(0xFFffffff),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            child: const Text('Cancelar',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
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
                              'Cadastrar',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

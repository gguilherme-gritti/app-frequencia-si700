import 'package:flutter/material.dart';
import 'package:frequency/model/register_user_data.dart';
import 'package:frequency/screens/home_frequency.dart';
import 'package:frequency/screens/login.dart';

class AboutApp extends StatelessWidget {
  const AboutApp();

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
                width: 450.0,
                height: 450.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/img/frequency.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'FrequencYou',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Controle VOCÊ mesmo sua frequência de acordo com as disciplinas do seu curso!',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black45,
                              fontFamily: 'Poppins'),
                        ),
                        const SizedBox(height: 45),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const Login()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 65),
                              backgroundColor: const Color(0xFF4157ff),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Row(
                              children: [
                                SizedBox(width: 15),
                                Text(
                                  'Quero marcar minha presença!',
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Poppins'),
                                ),
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.arrow_forward)),
                                ),
                              ],
                            )),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

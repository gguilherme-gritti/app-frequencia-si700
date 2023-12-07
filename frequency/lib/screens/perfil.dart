import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/screens/home_frequency.dart';
import 'package:frequency/widgets/bullet_list.dart';

class Perfil extends StatelessWidget {
  const Perfil();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            return Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 35, bottom: 30),
                  width: 120.0,
                  height: 120.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('lib/assets/img/perfil.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        name(state),
                        const SizedBox(height: 20),
                        email(state),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(160, 132, 232, 1),
                              borderRadius: BorderRadius.circular(14)),
                          child: const SingleChildScrollView(
                            child: BulletList(strings: []),
                          ),
                        ),
                        const SizedBox(height: 30),
                        back(context)
                      ],
                    )),
              ],
            );
          }),
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

  Widget name(UserState state) {
    Widget child = const Text(
      '',
      style: TextStyle(
          fontSize: 28.0,
          color: Color(0xFF4157ff),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'),
      textAlign: TextAlign.center,
    );
    if (state is LoadingUser) {
      if (state.load) {
        child = const CircularProgressIndicator();
      }
    } else if (state is UserData) {
      final name = state.user.name;

      child = Text(
        name,
        style: const TextStyle(
            fontSize: 28.0,
            color: Color(0xFF4157ff),
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'),
        textAlign: TextAlign.center,
      );
    }

    return child;
  }

  Widget email(UserState state) {
    Widget child = const Text(
      '',
      style: TextStyle(fontSize: 20.0, fontFamily: 'Poppins'),
      textAlign: TextAlign.center,
    );
    if (state is LoadingUser) {
      if (state.load) {
        child = const CircularProgressIndicator();
      }
    } else if (state is UserData) {
      final email = state.user.email;

      child = Text(
        email,
        style: const TextStyle(fontSize: 20.0, fontFamily: 'Poppins'),
        textAlign: TextAlign.center,
      );
    }

    return child;
  }
}

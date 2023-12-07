import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_bloc.dart';
import 'package:frequency/bloc/auth/auth_event.dart';
import 'package:frequency/bloc/auth/auth_state.dart';
import 'package:frequency/screens/courses.dart';
import 'package:frequency/screens/disciplines.dart';
import 'package:frequency/screens/login.dart';
import 'package:frequency/screens/perfil.dart';
import 'package:frequency/screens/register_course.dart';
import 'package:frequency/screens/register_discipline.dart';
import 'package:frequency/widgets/card_icon_button.dart';
import 'package:frequency/widgets/courses_list_view.dart';
import 'package:frequency/widgets/deatch_icon_card_button.dart';

class ManagementCard extends StatelessWidget {
  const ManagementCard();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => {
        if (state is UnAuthenticated)
          {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Login()))
          }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Text(
              'Gerenciamento',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CardIconButton(
                    icon: Icons.calendar_month,
                    text: 'Frequência',
                    onPressed: () {}),
                const SizedBox(
                  width: 15,
                ),
                CardIconButton(
                    icon: Icons.add_card,
                    text: 'Disciplinas',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const Disciplines()));
                    }),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CardIconButton(
                    icon: Icons.school,
                    text: 'Cursos',
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Courses()));
                    }),
                const SizedBox(
                  width: 15,
                ),
                CardIconButton(
                    icon: Icons.person_2_outlined,
                    text: 'Perfil',
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Perfil()));
                    }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                DetachIconCardButton(
                    icon: Icons.calculate,
                    text: 'Percentual',
                    onPressed: () {}),
                const SizedBox(
                  width: 15,
                ),
                DetachIconCardButton(
                    icon: Icons.offline_share,
                    text: 'Sair',
                    onPressed: () {
                      context.read<AuthBloc>().add(SignOutRequested());
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frequency/widgets/card_icon_button.dart';

class ManagementCard extends StatelessWidget {
  const ManagementCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
        child: const Column(
          children: [
            Text(
              'Gerenciamento',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CardIconButton(
                    icon: Icons.calendar_month, text: 'Ver frequência'),
                SizedBox(
                  width: 15,
                ),
                CardIconButton(icon: Icons.add_card, text: 'Nova Disciplina'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

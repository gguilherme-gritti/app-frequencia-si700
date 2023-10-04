import 'package:flutter/material.dart';
import 'package:frequency/widgets/list_item.dart';

class DisciplinesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListItem(),
        ListItem(),
        ListItem(),
        ListItem(),
        // Adicione mais itens conforme necessário
      ],
    );
  }
}

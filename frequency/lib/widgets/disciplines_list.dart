import 'package:flutter/material.dart';
import 'package:frequency/widgets/list_item.dart';

class DisciplinesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        SizedBox(height: 15),
        ListItem(),
        ListItem(),
        ListItem(),
        ListItem(),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const ListItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xffeeeeff),
            ),
            child: const Icon(
              Icons.school,
              color: Color(0xFF4157ff),
              size: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'SI700A',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                color: Color(0xFF4157ff),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Programação para Dispositivos Móveis',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.delete,
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}

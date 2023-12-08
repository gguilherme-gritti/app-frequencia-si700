import 'package:flutter/material.dart';

class FrequencyItemList extends StatelessWidget {
  final Map<String, dynamic> data;
  const FrequencyItemList({Key? key, required this.data}) : super(key: key);

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
          Text(
            data['presence'] ? 'Presença' : 'Faltou',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              color: data['presence'] ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            data['date'],
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            data['discipline_id'],
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

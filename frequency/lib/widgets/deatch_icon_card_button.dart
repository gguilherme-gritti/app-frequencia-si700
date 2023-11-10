import 'package:flutter/material.dart';

class DetachIconCardButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onPressed;

  const DetachIconCardButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 80),
              backgroundColor: const Color(0xffeeeeff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffeeeeff),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: const Color(0xFF4157ff),
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(text,
              style: const TextStyle(
                  fontSize: 14, fontFamily: 'Poppins', color: Colors.black87))
        ],
      ),
    );
  }
}




// return Expanded(
//         child: Column(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 80,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             color: Color(0xffeeeeff),
//           ),
//           child: Icon(
//             icon,
//             color: const Color(0xFF4157ff),
//             size: 35,
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Text(
//           text,
//           style: const TextStyle(
//               fontSize: 14, fontFamily: 'Poppins', color: Colors.black87),
//         )
//       ],
//     ));
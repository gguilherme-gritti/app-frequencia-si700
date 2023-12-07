import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  String id;
  String ra;
  String email;
  String name;
  String password;

  UserDataModel(
      {required this.id,
      required this.ra,
      required this.email,
      required this.name,
      required this.password});

  factory UserDataModel.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return UserDataModel(
      id: doc.id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      password: data['password'] ?? '',
      ra: data['ra'] ?? '',
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frequency/model/register_user_data.dart';

class FirestoreRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addUser({required RegisterUserData userData}) async {
    try {
      final user = <String, dynamic>{
        "email": userData.email,
        "name": userData.name,
        "password": userData.password,
        "ra": userData.ra
      };

      await _db.collection("user").add(user).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      throw Exception(e);
    }
  }
}

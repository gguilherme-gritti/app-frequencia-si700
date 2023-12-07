import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frequency/model/firebase/user_data.dart';
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

  Future<UserDataModel> getUser({required String email}) async {
    try {
      var users =
          await _db.collection("user").where('email', isEqualTo: email).get();

      if (users.docs.isNotEmpty) {
        print('Usuário encontrado');
      } else {
        throw Exception('Dados do usuário não encontrado');
      }

      return UserDataModel.fromFirestore(users.docs.first);
    } catch (e) {
      throw Exception(e);
    }
  }
}

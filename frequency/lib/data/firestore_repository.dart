import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frequency/model/firebase/course_data.dart';
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

      print(users.docs.first.id);
      return UserDataModel.fromFirestore(users.docs.first);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addCourse(
      {required CourseDataModel courseData, required String userId}) async {
    try {
      final course = <String, dynamic>{
        "code": courseData.code,
        "description": courseData.description,
      };

      CollectionReference ref =
          _db.collection('user').doc(userId).collection('course');

      await ref.add(course).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getCourses({required String userId}) async {
    try {
      var coursesQuery =
          await _db.collection('user').doc(userId).collection('course').get();

      List<DocumentSnapshot> courses = coursesQuery.docs;

      for (var course in courses) {
        Map<String, dynamic>? data = course.data() as Map<String, dynamic>?;

        if (data != null) {
          print('Dados do curso: $data');
        } else {
          print('Dados do curso estão vazios ou nulos.');
        }
      }

      print(courses);
      return courses;

      // Itera sobre os documentos da coleção filha
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frequency/model/firebase/course_data.dart';
import 'package:frequency/model/firebase/discipline_data.dart';
import 'package:frequency/model/firebase/frequency_data.dart';
import 'package:frequency/model/firebase/user_data.dart';
import 'package:frequency/model/register_user_data.dart';
import 'package:intl/intl.dart';

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
      } else {
        throw Exception('Dados do usuário não encontrado');
      }

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

  Future<List<Map<String, dynamic>>> getCourses(
      {required String userId}) async {
    try {
      var coursesQuery =
          await _db.collection('user').doc(userId).collection('course').get();

      List<DocumentSnapshot> courses = coursesQuery.docs;

      List<Map<String, dynamic>> coursesList = [];

      for (var course in courses) {
        Map<String, dynamic>? data = course.data() as Map<String, dynamic>?;

        if (data != null) {
          Map<String, dynamic> courseObject = {
            'id': course.id,
            'code': data['code'],
            'description': data['description']
          };

          coursesList.add(courseObject);
        } else {
          print('Dados do curso estão vazios ou nulos.');
        }
      }

      return coursesList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addDiscipline(
      {required DisciplineDataModel disciplineData,
      required String userId}) async {
    try {
      final discipline = <String, dynamic>{
        "code": disciplineData.code,
        "description": disciplineData.description,
        "week_day": disciplineData.week_day,
        "initial_hour": disciplineData.initial_hour,
        "final_hour": disciplineData.final_hour
      };

      CollectionReference ref = _db
          .collection('user')
          .doc(userId)
          .collection('course')
          .doc(disciplineData.course_id)
          .collection('discipline');

      await ref.add(discipline).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> getDisciplines(
      {required String userId, required String courseId}) async {
    try {
      var disciplinesQuery = await _db
          .collection('user')
          .doc(userId)
          .collection('course')
          .doc(courseId)
          .collection('discipline')
          .get();

      List<DocumentSnapshot> disciplines = disciplinesQuery.docs;

      List<Map<String, dynamic>> disciplinesList = [];

      for (var discipline in disciplines) {
        Map<String, dynamic>? data = discipline.data() as Map<String, dynamic>?;

        if (data != null) {
          Map<String, dynamic> disciplineObject = {
            'id': discipline.id,
            'code': data['code'],
            'week_day': data['week_day'],
            'initial_hour': data['initial_hour'],
            'final_hour': data['final_hour'],
            'description': data['description']
          };

          disciplinesList.add(disciplineObject);
        } else {
          print('Dados do curso estão vazios ou nulos.');
        }
      }

      return disciplinesList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addFrequency(
      {required FrequencyDataModel frequencyData,
      required String userId}) async {
    try {
      final frequency = <String, dynamic>{
        "discipline_id": frequencyData.discipline_id,
        "date": frequencyData.date,
        "presence": frequencyData.presence,
      };

      CollectionReference ref =
          _db.collection('user').doc(userId).collection('frequency');

      await ref.add(frequency).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getTodayDiscipline({required String userId}) async {
    try {
      DateTime now = DateTime.now();

      String formattedWeekDay =
          DateFormat.E('pt_BR').format(now).substring(0, 3).toLowerCase();

      var disciplinesQuery =
          await _db.collection('user').doc(userId).collection('course').get();

      List<QueryDocumentSnapshot> allDisciplines = [];
      print('wheek');
      print(formattedWeekDay);

      for (var courseDoc in disciplinesQuery.docs) {
        var courseId = courseDoc.id;

        var disciplineQuery = await _db
            .collection('user')
            .doc(userId)
            .collection('course')
            .doc(courseId)
            .collection('discipline')
            .where('week_day', isEqualTo: formattedWeekDay)
            .get();

        allDisciplines.addAll(disciplineQuery.docs);
      }

      List<Map<String, dynamic>> disciplinesList = [];

      if (allDisciplines.isEmpty) {
        print("empty");
        throw Exception('Nenhuma aula encontrada para hoje');
      }

      Map<String, dynamic>? data =
          allDisciplines.first.data() as Map<String, dynamic>?;

      Map<String, dynamic> disciplineObject = {};

      if (data != null) {
        disciplineObject = {
          'id': allDisciplines.first.id,
          'code': data['code'],
          'week_day': data['week_day'],
          'initial_hour': data['initial_hour'],
          'final_hour': data['final_hour'],
          'description': data['description']
        };
      }

      return disciplineObject;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> getTodayPresence(
      {required String discipline_id,
      required String date,
      required String userId}) async {
    try {
      var presence = await _db
          .collection("user")
          .doc(userId)
          .collection('frequency')
          .where('discipline_id', isEqualTo: discipline_id)
          .where('date', isEqualTo: date)
          .get();

      if (presence.docs.isNotEmpty) {
        return true;
      }

      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}

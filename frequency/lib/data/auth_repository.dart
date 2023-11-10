import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('Essa senha está fraca');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('Uma conta ja existe pra esse email');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }

    return userCredential.user != null ? true : false;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

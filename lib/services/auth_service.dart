import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCreds = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCreds.user;
  }

  Future<User?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCreds = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCreds.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

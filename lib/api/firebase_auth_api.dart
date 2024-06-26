import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthApi {
  late FirebaseAuth auth;
  
  FirebaseAuthApi() {
    auth = FirebaseAuth.instance;
  }

  Stream<User?> fetchUser() {
    return auth.authStateChanges();
  }

  User? getUser() {
    return auth.currentUser;
  }

  Future<void> signUp(String email, String password) async {
    
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch(e) {
      print('Firebase Error: ${e.code} : ${e.message}');
    } catch(e) {
      print('Error: $e');
    }
  }

  Future<String?> signIn(String email, String password) async {
    
    try {
      UserCredential credentials = await auth.signInWithEmailAndPassword(email: email, password: password);

      print(credentials);
      print("&&&&%%%%%%%%%&@&@%&&++&+#+&+&#+&+#+&");
      return "Signed in successfully";
    } on FirebaseException catch(e) {
      return 'Firebase Error: ${e.code} : ${e.message}';
    } catch(e) {
      return 'Error: $e';
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

}
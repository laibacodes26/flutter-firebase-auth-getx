import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  User? get currentFirebaseUser=>_auth.currentUser;
  Stream<User?> get authStateChanges=>_auth.authStateChanges();

  Future<void> signUp({required String name,required String email,required String password}) async {
    final credential=await _auth.createUserWithEmailAndPassword(email:email,password:password);
    final uid=credential.user!.uid;
    await credential.user!.updateDisplayName(name);
    await _firestore.collection('users').doc(uid).set({'name':name,'email':email});
    await _auth.signOut();
  }

  Future<UserModel> login({required String email,required String password}) async {
    final credential=await _auth.signInWithEmailAndPassword(email:email,password:password);
    final uid=credential.user!.uid;
    final doc=await _firestore.collection('users').doc(uid).get();
    if(doc.exists){
      return UserModel.fromMap(uid,doc.data()!);
    }
    return UserModel(uid:uid,name:email.split('@').first,email:email);
  }

  Future<void> logout()=>_auth.signOut();

  String mapError(FirebaseAuthException e){
    switch(e.code){
      case 'email-already-in-use': return 'This email is already registered';
      case 'invalid-email': return 'Please enter a valid email';
      case 'weak-password': return 'Password is too weak (min 6 characters)';
      case 'user-not-found': return 'No account found with this email';
      case 'wrong-password': return 'Incorrect password';
      case 'invalid-credential': return 'Invalid email or password';
      case 'too-many-requests': return 'Too many attempts. Please try again later';
      case 'network-request-failed': return 'Network error. Check your connection';
      default: return e.message??'Authentication failed';
    }
  }
}
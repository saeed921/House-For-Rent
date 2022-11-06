import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //create an object of FirebaseAuth
  static final FirebaseAuth _auth= FirebaseAuth.instance;

  //Find Current user
static  User? get user =>_auth.currentUser;

  //Login Method

static Future<bool> login(String email, String password)async{
  _auth.signInWithEmailAndPassword(email: email, password: password);
  final credential= await _auth.signInWithEmailAndPassword(email: email, password: password);
  return credential.user!=null;
}

    //register method

  static Future<bool>register(String email, String password) async{
  _auth.createUserWithEmailAndPassword(email: email, password: password);
  final credential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
  return credential.user!=null;
}
    //logout
  static Future<void> logout()=>_auth.signOut();
static Future<void>updateDisplayName(String name)=>
_auth.currentUser!.updateDisplayName(name);

  static Future<void>updatePhotoUrl(String url)=>
      _auth.currentUser!.updatePhotoURL(url);

static Future<void> updateEmail( String email){
 return _auth.currentUser!.updateEmail(email);
}

}
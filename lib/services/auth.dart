import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;

  //SIGN IN WITH EMAIL & PASS
  Future signInWithEmail(String email,String pass) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user= result.user;
      return user;

    }catch(e){
      print(e.toString());
      return null;

    }

  }


  //SIGNUP WITH EMAIL& PASS
  Future signUpWithEmail(String email,String pass) async{
    print('email in Firebase Auth :$email, pass :$pass ');
    try{
       AuthResult authResult= await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user= authResult.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future getCurrentUser()async{
    FirebaseUser user=await _auth.currentUser();
    String uid=user.uid;
    return uid;

  }


}
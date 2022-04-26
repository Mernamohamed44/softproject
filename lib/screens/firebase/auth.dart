import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
 final String emailController ;
 final  String passwordController;
  Authentication(this.emailController,this.passwordController);
  Future <String?> signIn() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController, password: passwordController);
        return"Signed In";
    }
       on FirebaseAuthException catch(e){
       return e.message;
        }
  }
  Future <String?> signUp() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController, password: passwordController);
      return"Signed Up";
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}
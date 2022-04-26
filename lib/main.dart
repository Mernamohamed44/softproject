import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softproject/screens/firebase/auth.dart';
import 'screens/login.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());}
 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
        providers: [
          Provider<Authentication>(create: (_)=> Authentication(FirebaseAuth.instance)),
          StreamProvider(create: (context)=>context.read<Authentication>().authStateChanges,initialData: null ,)
        ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}

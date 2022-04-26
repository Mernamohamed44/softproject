import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/screen_textfield.dart';
import 'firebase/auth.dart';

// ignore: must_be_immutable
class NewAccount extends StatelessWidget {
  Color c = const Color.fromRGBO(196, 230, 251, 1);
  Color cb = const Color.fromRGBO(61, 103, 107, 1);

  Widget miniTextfield() {
    return const SizedBox(
      height: 30,
      width: 30,
      child: TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Account'),
        backgroundColor: cb,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const ScreenTextField('Enter your name'),
              const SizedBox(
                height: 15,
              ),
              const ScreenTextField('Enter SSN'),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text('Enter email'),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text('Enter password'),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text('confirm password'),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: cb,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  height: 40,
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<Authentication>()
                          .signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim())
                          .then((value) => Navigator.pop(context));
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

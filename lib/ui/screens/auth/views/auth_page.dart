import 'dart:math';

import 'package:acme_app/ui/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _formLogin()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _formLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Inciar Sesion", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldWidget(
            hintText: "Usuario",
            isPasswordField: false,
            texfieldController: _emailController),
        const SizedBox(
          height: 10,
        ),
        TextFormFieldWidget(
          hintText: "Contraseña",
          isPasswordField: true,
          texfieldController: _passwordController,
        ),
        const SizedBox(
          height: 10,
        ),
        RaisedButton(
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _signIn(),
        ),
      ],
    );
  }

  Future _signIn() async {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await Future.delayed(Duration(milliseconds: 600));
    } on FirebaseAuthException catch (e) {
      await Future.delayed(Duration(milliseconds: 600));
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: Container(
            width: 200,
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(
              "Usuario /Contraseña incorrecta",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }
}

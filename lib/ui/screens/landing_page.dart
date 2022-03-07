import 'package:acme_app/ui/screens/auth/views/auth_page.dart';
import 'package:acme_app/ui/screens/surveys/views/survey_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _activeSession(),
    );
  }

  Widget _activeSession() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SurveyPage();
        } else {
          return AuthPage();
        }
      },
    );
  }
}

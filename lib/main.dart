import 'package:acme_app/services/db.dart';
import 'package:acme_app/ui/screens/landing_page.dart';
import 'package:acme_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseService db = DatabaseService();
    return MultiProvider(
      providers: [
        Provider<DatabaseService>.value(
          value: db,
        ),
      ],
      child: MaterialApp(
        home: LandingPage(),
        theme: defaultTheme(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// import 'package:nc_project/pages/home_page.dart';
// import 'package:nc_project/pages/loading_page.dart';
import 'package:nc_project/pages/login_page.dart';
// import 'package:nc_project/pages/profile_page.dart';
import 'package:nc_project/pages/register_page.dart';
import 'package:nc_project/pages/chat_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partial Pets',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: "login",
      routes: {
        // "/": (context) => LoadingPage(),
        "register": (context) => const RegisterPage(),
        "login": (context) => LoginPage(),
        // "home": (context) => HomePage(),
        // "profile": (context) => ProfilePage(),
        "chat": (context) => ChatPage(),
      },
    );
  }
}

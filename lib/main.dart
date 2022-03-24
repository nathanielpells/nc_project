import 'package:flutter/material.dart';
import 'package:nc_project/pages/add_pet_page.dart';
import 'package:nc_project/pages/camera_page.dart';

// import 'package:nc_project/pages/home_page.dart';
// import 'package:nc_project/pages/loading_page.dart';
import 'package:nc_project/pages/login_page.dart';
import 'package:nc_project/pages/profile_page.dart';
import 'package:nc_project/pages/register_page.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(const MyApp(firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TakePictureScreen(
        camera: firstCamera,
      ),
      title: 'Partial Pets',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: "profile",
      routes: {
        // "/": (context) => LoadingPage(),
        "register": (context) => const RegisterPage(),
        "login": (context) => const LoginPage(),
        // "home": (context) => HomePage(),
        "profile": (context) => const ProfilePage(),
        "addpet": (context) => const AddPetPage(),
      },
    );
  }
}

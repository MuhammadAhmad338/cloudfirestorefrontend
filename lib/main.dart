import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlecloud/Services/cloudsqlServices.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Services/imageServices.dart';
import 'package:googlecloud/Views/allDogs.dart';
import 'package:googlecloud/Views/signUpScreen.dart';
import 'package:googlecloud/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataServices()),
      ChangeNotifierProvider(create: (_) => ImageServices()),
      ChangeNotifierProvider(create: (_) => CloudsqlServices())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? signedToken = "";
// This widget is the root of your application.

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      signedToken = prefs.getString('token');
    });
  }

  @override
  void initState() {
    // Ahmad
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Google Cloud',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Tilt Neon",
            scaffoldBackgroundColor: const Color.fromARGB(255, 248, 228, 191),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true),
        home: signedToken == null
            ? SignUpScreen(token: signedToken)
            : AllDogs(token: signedToken));
  }
}

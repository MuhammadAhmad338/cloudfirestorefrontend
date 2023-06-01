import 'package:flutter/material.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Views/allDogs.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MultiProvider(
    providers: [
       ChangeNotifierProvider(create: (_) => DataServices())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Google Cloud',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Tilt Neon",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        home: const AllDogs());
  }
}

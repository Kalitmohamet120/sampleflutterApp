import 'package:flutter/material.dart';
import 'package:talowadaag/common/constants/plate.dart';
import 'package:talowadaag/common/widgets/action_button.dart';
import 'package:talowadaag/features/authentications/signin_screen.dart';
import 'package:talowadaag/features/home/home_screen.dart';
import 'package:talowadaag/features/idea/idea_screen.dart';

import 'features/authentications/signup_screen.dart';
import 'features/comapny/company_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                widget: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => HomeScreen()));
                },
                backgroundColor: Plate.primaryColor,

              ),
              const SizedBox(
                height: 10,
              ),
              ActionButton(
                widget: const Text(
                  'Idea form',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => IdeaScreen()));
                },
                backgroundColor: Plate.primaryColor,

              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

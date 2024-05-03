import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
         title: Text('Talo Wadaag',),
         centerTitle: true,
         actions: [Icon(Icons.search_outlined,size: 10,)
         ],
         ),
         body: SafeArea(child: Column(
          children: [Row(children: [
            ListTile(trailing: CircleAvatar(backgroundColor: Colors.indigo.shade900,),),],)],)
         ),
        ),

      );
  
  }
}
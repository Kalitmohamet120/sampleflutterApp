import 'package:flutter/material.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar:AppBar(
          title: Text('Back'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 44, 15, 131),),
          onPressed: () {
            Navigator.pop(context);  // Go back to the previous screen
          },
        )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       Image.asset('assets/logo.jpeg', height: 100),
       Padding(padding: EdgeInsets.fromLTRB(25.0,150,10,80),
       child:Column(children: [
        CircleAvatar(
         backgroundImage: AssetImage('assets/telesom.logo.png'),  // Your asset path
          backgroundColor: Colors.grey.shade200,
        radius: 70,),
        
        Text('    About Combany.....'),  
TextField(),
     
       ],),
      
       )
        ],),
        
        
        ),
    );
     }
}



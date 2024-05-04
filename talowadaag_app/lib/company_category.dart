import 'package:flutter/material.dart';

class Company_cat extends StatefulWidget {
  const Company_cat({super.key});

  @override
  State<Company_cat> createState() => _Company_catState();
}

class _Company_catState extends State<Company_cat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: Text('Back'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 44, 15, 131),),
          onPressed: () {
            Navigator.pop(context);  // Go back to the previous screen
          },)),

    

   
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset('assets/logo.jpeg', height: 100),
           Padding(
             padding: const EdgeInsets.fromLTRB(25.0,250,10,80),
             child: Column(
              children: [Row
              
             //
             (children: [
               Text('Company Category',
               style: TextStyle(
                fontSize: 30,color: const Color.fromARGB(255, 44, 15, 131)),),
            ],),
            SizedBox(height: 30,),
             TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Company Name',
           
                ),
             ),
             SizedBox(height: 100,),
             ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(title: Text('Checking'),
                content: Text('do you want to save '),
                actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text('No',style : TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey.shade400)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  );
              
              });
             }, child: Text(
              'Submit',style: TextStyle
              (fontSize: 30,color: Colors.white),
             ),style:ElevatedButton.styleFrom(
              backgroundColor:Color.fromARGB(255, 44, 15, 131)))
             ],),
           ),
         ],
       ),
      ),
    );
  }
}
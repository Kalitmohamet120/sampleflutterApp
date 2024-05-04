import 'package:flutter/material.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
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
          },)
          ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/logo.jpeg', height: 100),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 10, 10, 0),
          ),
          Row(
            children: [
              Text("   Create your Company profile         ",
                  style: TextStyle(
                      fontSize: 40,
                      color: const Color.fromARGB(255, 44, 15, 131) )),
            ]),
                      SizedBox(height: 30,),
             TextField(
                decoration: InputDecoration(
             
                  border: OutlineInputBorder(),
                  prefixIcon:Icon(Icons.home_work_outlined,color: Color.fromARGB(255, 44, 15, 131),),
                  labelText: 'Company Name',
                  ),
           
                ),
                SizedBox(height: 30,),
                TextFormField(
              decoration: InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.share_location_rounded,color:Color.fromARGB(255, 44, 15, 131) ,), 
                border: OutlineInputBorder(), 
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Text('Discription:', style: TextStyle(fontSize: 25,color:Color.fromARGB(255, 44, 15, 131) ),),
            ),
         TextFormField(
              maxLines: 8,  // Adjust this to increase or decrease the height
              decoration: InputDecoration(
                hintText: 'Enter your description here...',
                border: OutlineInputBorder(),)
              ),

              SizedBox(height: 20,),

              TextButton(onPressed: (){},

               child: Text('Upload Logo',
               style:TextStyle(fontSize: 18,color: Colors.white),),
               style:ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 44, 15, 131))
        ),
        ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(title: Text('Checking'),
                backgroundColor: Colors.blue.shade400,
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
             }, child: Text('Submit',style: TextStyle(fontSize: 30,color: Colors.white),
             ),style:ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 44, 15, 131)))
        ],
          ),
        ),
        
    );
  }
}

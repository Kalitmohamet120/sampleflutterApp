// import 'package:flutter/material.dart';
//
// class IdeaScreen extends StatelessWidget {
//   const IdeaScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }



import 'package:flutter/material.dart';

class IdeaScreen extends StatefulWidget {
  const IdeaScreen(
      {super.key});

  @override
  State<IdeaScreen> createState() => _IdeaScreen();
}

class _IdeaScreen extends State<IdeaScreen> {
  final fkey = GlobalKey<FormState>();

  String Company = '';
  String Category = '';
  String Idea_Title = '';
  String Description = '';
  String fname = '';
  String mother = '';
  String mobile = '';
  String email = '';
  String password = '';
  String country = '';
  String gender = '';
  String Status = '';
  String Priority = '';

  String address = '';

  bool policy = false;

  Widget buildtexbox(int index, String label, String hint, IconData icon,
      TextInputType keyboard, bool ispassword) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        obscureText: ispassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: Icon(icon),
        ),
        onSaved: (newValue) {
          if (index == 1) {
            Company = newValue ?? '';
          } else if (index == 2) {
            Category = newValue ?? '';
          } else if (index == 3) {
            Idea_Title = newValue ?? '';
          } else if (index == 4) {
            Description = newValue ?? '';
          } else if (index == 5) {
            password = newValue ?? '';
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '$label is required / waa loobahanyahe';
          }

          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Fill The Idea Form ')),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: fkey,
        autovalidateMode: AutovalidateMode.always,
        //title: '', //  please check this.....
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
          child: ListView(
            children: [
              SizedBox(
                height: 30.0,
              ),
              buildtexbox(
                  1,
                  'Company Name / Magacaga Companiga',
                  'Enter Company Name',
                  Icons.person_2_outlined,
                  TextInputType.name,
                  false),
              buildtexbox(
                  2,
                  // 'Additonal Information / Xog Dheerada',
                  // 'Enter Your Addittional Info',
                  'Idea Category',
                  'Enter Category Info',
                  Icons.person_2_outlined,
                  TextInputType.name,
                  false),
              SizedBox(
                height: 15.0,
              ),
              buildtexbox(3, 'Your Idea Title ', 'Enter Idea Title',
                  Icons.person_2_outlined, TextInputType.name, false),
              buildtexbox(4, 'Description', 'Enter Idea Description Info',
                  Icons.person_2_outlined, TextInputType.name, false),
              SizedBox(
                height: 15.0,
              ),
              // ImageField(
              //   onSave: (List<ImageAndCaptionModel>? imageAndCaptionList) {
              //     //you can save imageAndCaptionList using local storage
              //     //or in a simple variable
              //   },
              // ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [],
              ),
              SizedBox(
                height: 15.0,
              ),
              CheckboxListTile(
                title: Text(
                  'Agree Policy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'I hereby confirm that I accepted all terms and conditions that apply to the use of this software. including distribution rights'),
                value: policy,
                onChanged: (value) {
                  setState(() {
                    policy = value ?? false;
                  });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed: () {
                        // to validate the field
                        if (fkey.currentState!.validate()) {
                          fkey.currentState!.save();

                          //print('your name is $fname');
                          //print('your password is $password');

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Checking'),
                                  content: Text('do you want to save '),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text('No',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade400)),
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

                          // send it to the api
                        }
                      },
                      child: Row(
                        children: [
                          //Icon(Icons.send_outlined),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Submit Data'),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

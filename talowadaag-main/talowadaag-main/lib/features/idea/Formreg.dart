import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Formreg extends StatefulWidget {
  const Formreg(
      {super.key,
      required String title,
      required AutovalidateMode autovalidatemode});

  @override
  State<Formreg> createState() => _FormregState();
}

class _FormregState extends State<Formreg> {
  final fkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

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
            fname = newValue ?? '';
          } else if (index == 2) {
            mother = newValue ?? '';
          } else if (index == 3) {
            mobile = newValue ?? '';
          } else if (index == 4) {
            email = newValue ?? '';
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
        title: Text('Fill The Idea Category Registration Form '),
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
                  'Idea Status',
                  'Enter Your Addittional Info',
                  Icons.person_2_outlined,
                  TextInputType.name,
                  false),
              SizedBox(
                height: 15.0,
              ),
              // DropdownButtonFormField(
              //   onSaved: (newValue) {
              //     Status = newValue ?? '';
              //   },
              //   value: Status,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Idea Status iRs required';
              //     }
              //     return null;
              //   },
              //   items: [
              //     DropdownMenuItem(
              //       child: Text('Select the Current Idea status'),
              //       value: '',
              //     ),
              //     DropdownMenuItem(
              //       child: Text('Not Implemented'),
              //       value: 'NI',
              //     ),
              //     DropdownMenuItem(
              //       child: Text('Future Idea'),
              //       value: 'FI',
              //     ),
              //     DropdownMenuItem(
              //       child: Text('Low Priority'),
              //       value: 'LP',
              //     ),
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       Status = value ?? '';
              //     });
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'Your Idea  Status',
              //     prefix: Icon(Icons.map_outlined),
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              SizedBox(
                height: 15.0,
              ),
              DropdownButtonFormField(
                onSaved: (newValue) {
                  Priority = newValue ?? '';
                },
                value: Status,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Idea Priority is required';
                  }
                  return null;
                },
                items: [
                  DropdownMenuItem(
                    child: Text('Select the Current Priority of Your Idea'),
                    value: '',
                  ),
                  DropdownMenuItem(
                    child: Text('High Priority'),
                    value: 'HP',
                  ),
                  DropdownMenuItem(
                    child: Text('Medium Priority'),
                    value: 'mp',
                  ),
                  DropdownMenuItem(
                    child: Text('Low Priority'),
                    value: 'LP',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    Priority = value ?? '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Your Idea Priority Status',
                  prefix: Icon(Icons.map_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
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

                          print('your name is $fname');
                          print('your password is $password');

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

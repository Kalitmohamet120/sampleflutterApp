import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:talowadaag/features/authentications/signin_screen.dart';
import 'package:talowadaag/features/authentications/signup_screen.dart';

import '../../common/constants/plate.dart';
import '../../common/widgets/action_button.dart';
import '../../common/widgets/text_field.dart';
import '../home/home_screen.dart';

abstract class BasicAuthScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late BuildContext context;

  BasicAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  SizedBox logo({required double height}) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Image.asset('assets/images/logo.jpg'),
    );
  }

  Widget submitButton(
      {required String buttonTitle, required Function onSubmit}) {
    return ActionButton(
        widget: Text(
          buttonTitle,
          style: const TextStyle(
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white),
        ),
        backgroundColor: Plate.primaryColor,
        onTap: () => onSubmit());
  }

  RichText signInOrSignUp({
    required String askQuestion,
    required String doAction,
    bool isSignIn = true,
  }) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: askQuestion),
          TextSpan(
            text: doAction,
            style: TextStyle(
              color: Plate.primaryColor,
              decoration: TextDecoration.underline,
            ),
            // Add your navigation logic here
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigation logic here
                if (isSignIn) {
                  print('SignIn');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingInScreen()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                  print('SignUp');
                }
              },
          ),
        ],
      ),
    );
  }

  Widget emailTextField() {
    return CustomTextField(
        prefixIcon: Icons.email_outlined,
        hintText: 'email',
        isEmail: true,
        controller: emailController);
  }

  Widget passwordTextField() {
    return CustomTextField(
        prefixIcon: Icons.lock_open,
        suffixIcon: MdiIcons.eyeOffOutline,
        hintText: 'password',
        isPassword: true,
        controller: passwordController);
  }

  Form informationForm();

  void openHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}

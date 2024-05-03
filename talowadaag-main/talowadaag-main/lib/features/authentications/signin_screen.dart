import 'package:flutter/material.dart';
import 'package:talowadaag/common/widgets/text_button.dart';
import 'package:talowadaag/features/authentications/forgot_password.dart';
import 'package:talowadaag/features/authentications/user/user_service.dart';
import 'package:talowadaag/features/home/home_screen.dart';

import 'basic_auth_screen.dart';

class SingInScreen extends BasicAuthScreen {
  SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const SizedBox(
                  height: 40,
                ),
                informationForm(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      widget: const Text(
                        'forgot password?',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                submitButton(
                  buttonTitle: 'Login',
                  onSubmit: () {
                    FocusScope.of(context).unfocus();
                    if (!formKey.currentState!.validate()) return;
                    formKey.currentState!.save();

                    bool login = UserService.loginWithUsernamePassword(
                        email: emailController.text,
                        password: passwordController.text);

                    if (login) {
                      openHome();
                    }else{

                      SnackBar(
                        content: Text('Email and password are invalid'),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                signInOrSignUp(
                    askQuestion: 'I don\'t have an account ',
                    doAction: 'Register',
                    isSignIn: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Form informationForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          emailTextField(),
          passwordTextField(),
        ],
      ),
    );
  }

  SnackBar showMessage() {
    return const SnackBar(
      content: Text('Email and password are invalid'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:talowadaag/features/authentications/user/user_roles.dart';
import 'package:talowadaag/features/authentications/user/user_service.dart';

import '../../common/widgets/text_field.dart';
import 'basic_auth_screen.dart';

class SignupScreen extends BasicAuthScreen {
  final TextEditingController nameController = TextEditingController();

  SignupScreen({super.key});

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
                // Spacer(flex: 1,),
                const SizedBox(
                  height: 40,
                ),

                informationForm(),
                const SizedBox(
                  height: 50,
                ),
                signInOrSignUp(
                    askQuestion: 'Already have an account? ',
                    doAction: 'Login'),
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
          CustomTextField(
            hintText: 'name',
            controller: nameController,
            errorMessage: 'Please enter your name',
          ),
          emailTextField(),
          passwordTextField(),
          const SizedBox(
            height: 20,
          ),
          submitButton(
            buttonTitle: 'Sign up',
            onSubmit: () {
              FocusScope.of(context).unfocus();
              formKey.currentState!.validate();
              UserService.createUser(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  role: UserRole.user);

              openHome();
            },
          ),
        ],
      ),
    );
  }
}

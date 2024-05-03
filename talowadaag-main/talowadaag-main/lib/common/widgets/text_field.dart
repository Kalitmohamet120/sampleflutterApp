import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;
  final String? errorMessage;
  late bool isObscureText;

  CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.isEmail = false,
    required this.controller,
    this.errorMessage,
  }) {
    isObscureText = isPassword;
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    widget.isObscureText = !widget.isObscureText;
                    setState(() {});
                  },
                  icon: Icon(widget.suffixIcon),
                )
              : (widget.suffixIcon != null ? Icon(widget.suffixIcon) : null),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.blue.shade700,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        obscureText: widget.isObscureText,
        keyboardType: widget.isEmail ? TextInputType.emailAddress : null,
        validator: validator,
        onSaved: (val) => widget.controller.text = val!,
      ),
    );
  }

  String? validator(String? value) {
    if (widget.isEmail) {
      return validateEmail(value);
    } else if (widget.isPassword) {
      return validatePassword(value);
    } else {
      return validateRegularInput(value);
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    final RegExp emailRegex = RegExp(
      '^[a-zA-Z0-9._%+-]+@gmail.com\$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  dynamic validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password can\'t less than 6';
    }
    return null;
  }

  String? validateRegularInput(String? value) {
    if (value!.isEmpty) {
      return widget.errorMessage;
    }

    return null;
  }
}

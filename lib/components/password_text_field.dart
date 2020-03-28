import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool defaultVisibile;
  final InputBorder inputBorder;
  final String Function(String) validator;

  PasswordTextFormField(
      {Key key,
      this.controller,
      this.defaultVisibile = false,
      this.hintText,
      this.inputBorder,
      this.validator})
      : super(key: key);

  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState(
      this.controller,
      this.defaultVisibile,
      this.hintText,
      this.inputBorder,
      this.validator);
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  final TextEditingController controller;
  final String hintText;
  final InputBorder inputBorder;
  final String Function(String) validator;

  bool passwordVisible;

  PasswordTextFormFieldState(this.controller, this.passwordVisible, this.hintText,
      this.inputBorder, this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !passwordVisible,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          border: this.inputBorder,
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          )),
    );
  }
}

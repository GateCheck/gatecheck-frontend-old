import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool defaultVisibile;

  PasswordTextField(
      {Key key, this.controller, this.defaultVisibile = false, this.hintText})
      : super(key: key);

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState(
      this.controller, this.defaultVisibile, this.hintText);
}

class PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController controller;
  final String hintText;
  bool passwordVisible;

  PasswordTextFieldState(this.controller, this.passwordVisible, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: !passwordVisible,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
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
      ),
    );
  }
}

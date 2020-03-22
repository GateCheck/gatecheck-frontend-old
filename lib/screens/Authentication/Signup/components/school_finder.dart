import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/services/schools.dart';

class SchoolFinderTextField extends StatelessWidget {
  final schoolNamesFuture = getSchoolNames();
  final TextEditingController editController;
  final String hintText;

  SchoolFinderTextField({Key key, this.editController, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<String>>(
        stream: Stream.fromFuture(schoolNamesFuture),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SimpleAutoCompleteTextField(
              key: key,
              suggestions: snapshot.data,
              controller: editController,
              decoration: InputDecoration(hintText: hintText),
            );
          } else {
            return TextFormField(
              enabled: false,
              decoration: InputDecoration(hintText: "Loading schools..."),
            );
          }
        },
      ),
    );
  }
}

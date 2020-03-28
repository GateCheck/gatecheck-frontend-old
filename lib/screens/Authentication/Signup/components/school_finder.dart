import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/components/autocomplete_formfield.dart';
import 'package:gatecheck_frontend_flutter/services/schools.dart';

class SchoolAutoCompleteFormField extends StatefulWidget {
  final InputBorder border;
  final Future<List<String>> schoolNamesFuture = getSchoolNames();
  final String hintText;
  SchoolAutoCompleteFormField({Key key, this.border, this.hintText})
      : super(key: key);

  @override
  _SchoolAutoCompleteFormFieldState createState() =>
      _SchoolAutoCompleteFormFieldState(border, schoolNamesFuture, hintText);
}

class _SchoolAutoCompleteFormFieldState
    extends State<SchoolAutoCompleteFormField> {
  final InputBorder border;
  final Future<List<String>> schoolNamesFuture;
  final GlobalKey<AutoCompleteTextFieldState<String>> _autoCompleteKey =
      new GlobalKey();
  final String hintText;
  List<String> schoolNames;
  bool hasError = false;

  _SchoolAutoCompleteFormFieldState(
      this.border, this.schoolNamesFuture, this.hintText) {
    schoolNamesFuture
        .then((schoolNames) => this.schoolNames = schoolNames)
        .catchError((err) => hasError = true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: Stream.fromFuture(schoolNamesFuture),
          builder: (context, snapshot) => snapshot.hasData
              ? SimpleAutoCompleteTextField(
                  key: _autoCompleteKey,
                  suggestions: snapshot.data,
                  decoration:
                      InputDecoration(border: border, hintText: hintText),
                  validator: (school) {
                    if (hasError)
                      return "An error occurred fetching the schools.";
                    else if (!schoolNames.contains(school)) {
                      return 'You must choose a school from the list of schools.';
                    }
                    return null;
                  },
                )
              : TextFormField(
                  enabled: false,
                  validator: (str) => "Please wait until the schools load.",
                  decoration: InputDecoration(
                      hintText: "Loading schools...", border: border),
                )),
    );
  }
}

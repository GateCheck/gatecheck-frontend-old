import 'package:flutter/material.dart';

double getPercentageOfScreenWidth(context, double percent) {
  return (MediaQuery.of(context).size.width / 100) * percent;
}

double getPercentageOfScreenHeight(context, double percent) {
  return (MediaQuery.of(context).size.height / 100) * percent;
}

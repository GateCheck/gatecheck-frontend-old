import 'package:flutter/material.dart';
import 'package:gatecheck_frontend_flutter/utils/get_size.dart';

class EndFloatTopFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  final BuildContext context;
  const EndFloatTopFloatingActionButtonLocation(this.context);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Compute the x-axis offset.
    final double fabX =
        _endOffset(scaffoldGeometry) - getPercentageOfScreenHeight(context, 2.2);

    // Compute the y-axis offset.
    final double contentTop = scaffoldGeometry.contentTop;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;

    double fabY = contentTop + fabHeight + kFloatingActionButtonMargin;

    return Offset(fabX, fabY);
  }

  @override
  String toString() => 'FloatingActionButtonLocation.endFloat';
}

double _endOffset(ScaffoldPrelayoutGeometry scaffoldGeometry,
    {double offset = 0.0}) {
  assert(scaffoldGeometry.textDirection != null);
  switch (scaffoldGeometry.textDirection) {
    case TextDirection.rtl:
      return _leftOffset(scaffoldGeometry, offset: offset);
    case TextDirection.ltr:
      return _rightOffset(scaffoldGeometry, offset: offset);
  }
  return null;
}

double _leftOffset(ScaffoldPrelayoutGeometry scaffoldGeometry,
    {double offset = 0.0}) {
  return kFloatingActionButtonMargin + scaffoldGeometry.minInsets.left - offset;
}

double _rightOffset(ScaffoldPrelayoutGeometry scaffoldGeometry,
    {double offset = 0.0}) {
  return scaffoldGeometry.scaffoldSize.width -
      kFloatingActionButtonMargin -
      scaffoldGeometry.minInsets.right -
      scaffoldGeometry.floatingActionButtonSize.width +
      offset;
}

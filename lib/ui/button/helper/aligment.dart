import 'package:flutter/material.dart';

import '../../UiTheme.dart';

AlignmentGeometry getUiButtonAlignment({
  @required UiTheme theme,
  @required BuildContext context,
  bool fullWidth,
  AlignmentGeometry value,
}) {
  if (value != null) {
    return value;
  }
  if (fullWidth != true) {
    return Alignment.center;
  }

  return null;
}

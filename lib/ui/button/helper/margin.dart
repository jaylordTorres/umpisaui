import 'package:flutter/material.dart';

import '../../UiTheme.dart';
import '../UiButtonConstant.dart';

Map<UiButtonMargin, EdgeInsetsGeometry> uiButtonMargin = {
  UiButtonMargin.lg: EdgeInsets.all(24.0),
  UiButtonMargin.md: EdgeInsets.all(8.0),
  UiButtonMargin.sm: EdgeInsets.all(5.0),
};

EdgeInsetsGeometry getUiButtonMargin({
  @required UiTheme theme,
  @required BuildContext context,
  UiButtonVariant variant,
  UiButtonMargin boxMargin,
  EdgeInsetsGeometry value,
}) {
  if (value != null) {
    return value;
  }

  if (boxMargin != null && uiButtonMargin.containsKey(boxMargin)) {
    return uiButtonMargin[boxMargin];
  }

  return null;
}

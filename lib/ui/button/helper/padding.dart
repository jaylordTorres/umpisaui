import 'package:flutter/material.dart';

import '../../UiTheme.dart';
import '../UiButtonConstant.dart';

Map<UiButtonPaddding, EdgeInsetsGeometry> uiButtonPadding = {
  UiButtonPaddding.lg: EdgeInsets.all(30.0),
  UiButtonPaddding.md: EdgeInsets.all(24.0),
  UiButtonPaddding.sm: EdgeInsets.all(18.0),
  UiButtonPaddding.xs: EdgeInsets.all(12.0),
};

EdgeInsetsGeometry getUiButtonPadding({
  @required UiTheme theme,
  @required BuildContext context,
  UiButtonVariant variant,
  UiButtonPaddding boxPadding,
  EdgeInsetsGeometry value,
}) {
  if (value != null) {
    return value;
  }

  if (boxPadding != null && uiButtonPadding.containsKey(boxPadding)) {
    return uiButtonPadding[boxPadding];
  }

  return null;
}

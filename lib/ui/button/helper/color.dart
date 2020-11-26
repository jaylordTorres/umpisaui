import 'package:flutter/material.dart';

import '../../UiTheme.dart';
import '../../text/UiTextConstant.dart';
import '../UiButtonConstant.dart';

// COLORS
// highlight text
Map<UiButtonColor, UiTextColor> uiButtonTextColors = {
  UiButtonColor.primary: UiTextColor.primary,
  UiButtonColor.secondary: UiTextColor.secondary,
  UiButtonColor.success: UiTextColor.success,
  UiButtonColor.warning: UiTextColor.warning,
  UiButtonColor.alert: UiTextColor.alert,
  UiButtonColor.none: UiTextColor.none,
};

UiTextColor getUiButtonTextColor({
  @required UiTheme theme,
  @required BuildContext context,
  UiButtonVariant variant,
  UiButtonColor color,
  UiTextColor value,
}) {
  if (value != null) {
    return value;
  }
  if (variant == UiButtonVariant.contained && color == UiButtonColor.primary) {
    return UiTextColor.primaryAccent;
  }

  if (uiButtonTextColors.containsKey(color)) {
    return uiButtonTextColors[color];
  }

  return UiTextColor.none;
}

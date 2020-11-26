import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../UiTheme.dart';

import '../UiButtonConstant.dart';

// COLORS
// highlight text
Map<UiButtonColor, Color> uiButtonBacgroundOutlinedColors = {
  UiButtonColor.primary: UiColors.none,
  UiButtonColor.secondary: UiColors.none,
  UiButtonColor.success: UiColors.none,
  UiButtonColor.warning: UiColors.none,
  UiButtonColor.alert: UiColors.none,
  UiButtonColor.none: UiColors.none,
};

// highlight background
Map<UiButtonColor, Color> uiButtonBacgroundContainedColors = {
  UiButtonColor.primary: UiColors.primary,
  UiButtonColor.secondary: UiColors.secondaryAccent,
  UiButtonColor.success: UiColors.successAccent,
  UiButtonColor.warning: UiColors.warningAccent,
  UiButtonColor.alert: UiColors.alertAccent,
  UiButtonColor.none: UiColors.backgroundNone,
};

Color getUiButtonBackgroundColor({
  @required UiTheme theme,
  @required BuildContext context,
  UiButtonVariant variant,
  UiButtonColor color,
  Color value,
}) {
  if (value != null) {
    return value;
  }

// highlight background
  if ([UiButtonVariant.contained].contains(variant)) {
    if (uiButtonBacgroundContainedColors.containsKey(color)) {
      return uiButtonBacgroundContainedColors[color];
    }
  } else {
    if (uiButtonBacgroundOutlinedColors.containsKey(color)) {
      return uiButtonBacgroundOutlinedColors[color];
    }
  }

  return UiColors.none;
}

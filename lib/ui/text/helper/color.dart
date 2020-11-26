import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../UiTheme.dart';

import '../UiTextConstant.dart';

// COLORS
Map<UiTextColor, Color> uiTextColors = {
  UiTextColor.primary: UiColors.textPrimary,
  UiTextColor.primaryAccent: UiColors.primaryAccent,
  UiTextColor.secondary: UiColors.textSecondary,
  UiTextColor.secondaryAccent: UiColors.secondaryAccent,
  UiTextColor.success: UiColors.success,
  UiTextColor.successAccent: UiColors.successAccent,
  UiTextColor.warning: UiColors.warning,
  UiTextColor.warningAccent: UiColors.warningAccent,
  UiTextColor.alert: UiColors.alert,
  UiTextColor.alertAccent: UiColors.alertAccent,
  UiTextColor.none: UiColors.textNone,
  UiTextColor.noneAccent: UiColors.textNoneAccent,
};

// might add diff color on dif variant
Map<UiTextVariant, Color> uiTextVariantColors = {
  UiTextVariant.h1: uiTextColors[UiTextColor.none],
  UiTextVariant.h2: uiTextColors[UiTextColor.none],
  UiTextVariant.h3: uiTextColors[UiTextColor.none],
  UiTextVariant.none: uiTextColors[UiTextColor.none],
};

Color getUiTextColor({
  @required UiTheme theme,
  @required BuildContext context,
  UiTextVariant variant,
  UiTextColor textColor,
  Color value,
}) {
  if (value != null) {
    return value;
  }

  if (textColor != UiTextColor.none && uiTextColors.containsKey(textColor)) {
    return uiTextColors[textColor];
  }

  if (uiTextVariantColors.containsKey(variant)) {
    return uiTextVariantColors[variant];
  }
  return UiColors.textNone;
}

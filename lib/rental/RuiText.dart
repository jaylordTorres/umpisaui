import 'package:flutter/material.dart';
import 'package:umpui/core.dart';

// import 'RuiConstant.dart';

class RuiText extends StatelessWidget {
  static String name = 'RuiText';
  final String appBarTitle;
  const RuiText({Key key, this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    UiTextColor textColor;
    UiTextVariant variant;
    String title = '';

    if (this.appBarTitle != null && appBarTitle.isNotEmpty) {
      // todo: fix color const
      // textColor = UiTextColor.primary;
      color = Color.fromRGBO(41, 10, 71, 1);
      variant = UiTextVariant.h3;
      title = this.appBarTitle;
    }
    return UiText(
      title: title,
      textColor: textColor,
      variant: variant,
      color: color,
    );
  }
}

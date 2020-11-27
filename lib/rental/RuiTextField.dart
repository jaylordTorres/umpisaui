import 'package:flutter/material.dart';
import 'package:umpui/core.dart';
import 'package:umpui/rental/RuiConstant.dart';
import 'package:umpui/ui/constants/colors.dart';

class RuiTextField extends StatelessWidget {
  static String name = 'RuiTextField';
  final String labelText;
  final String helperText;
  final String hintText;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final RuiTextFieldType type;
  const RuiTextField(
      {Key key,
      this.labelText,
      this.controller,
      this.validator,
      this.keyboardType,
      this.helperText,
      this.hintText,
      this.type = RuiTextFieldType.underlinePrimary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (this.type) {
      case RuiTextFieldType.underlinePrimary:
        {
          color = UiColors.primary;
        }
        break;
      default:
        {}
    }

    return Theme(
      data: ThemeData(primaryColor: color),
      child: TextFormField(
        controller: this.controller,
        validator: this.validator,
        keyboardType: this.keyboardType,
        decoration: InputDecoration(
          hintText: this.hintText,
          helperText: this.helperText,
          labelText: this.labelText,
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color, width: 2)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2)),
        ),
      ),
    );
  }
}

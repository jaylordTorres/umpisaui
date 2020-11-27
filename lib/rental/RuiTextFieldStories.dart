import 'package:storybook_flutter/storybook_flutter.dart';

import 'RuiTextField.dart';
import 'RuiConstant.dart';

List<Story> ruiTextFieldStories = [
  Story(
    name: "${RuiTextField.name}",
    builder: (_, k) => RuiTextField(
        labelText: k.text('labelText', initial: "Confirm Password"),
        type: k.options(
          'type',
          initial: RuiTextFieldType.underlinePrimary,
          options: RuiTextFieldType.values
              .map((type) => Option(type.toString(), type))
              .toList(),
        ),
        hintText: k.text('hintText', initial: "Enter here...")),
  ),
];

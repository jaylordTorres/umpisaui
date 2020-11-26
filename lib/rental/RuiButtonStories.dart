import 'package:storybook_flutter/storybook_flutter.dart';

import 'RuiButton.dart';
import 'RuiConstant.dart';

List<Story> ruiButtonStories = [
  Story(
    // background: Colors.white,
    name: "${RuiButton.name}",
    builder: (_, k) => RuiButton(
      title: k.text('title', initial: "Submit"),
      type: k.options(
        'type',
        initial: RuiButtonType.containedPrimary,
        options: RuiButtonType.values
            .map((type) => Option(type.toString(), type))
            .toList(),
      ),
      onPressed: () {},
    ),
  )
];

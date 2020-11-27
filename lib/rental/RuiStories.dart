import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'RuiButtonStories.dart';
import 'RuiTextFieldStories.dart';

void main() {
  runApp(RuiStoriesScreen());
}

class RuiStoriesScreen extends StatelessWidget {
  // final uiTextStories;

  const RuiStoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      children: [
        ...ruiButtonStories,
        ...ruiTextFieldStories,
      ],
    );
  }
}

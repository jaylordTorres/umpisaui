import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'button/UiButtonStories.dart';
import 'text/UiTextStories.dart';

void main() {
  runApp(UiStoriesScreen());
}

class UiStoriesScreen extends StatelessWidget {
  // final uiTextStories;

  const UiStoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // uiTextStories = uiTextStories;

    return Storybook(
      children: [
        ...uiTextStories,
        ...uiButtonStories,
      ],
    );
  }
}

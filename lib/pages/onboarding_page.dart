import 'package:flutter/material.dart';
import 'package:welo/widgets/background_view.dart';
import 'package:welo/widgets/contained_view.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Stack(
      children: [
        // BackgroundView(),
        ContainedView(),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController(initialPage: 0);
    //   return Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       child: Image.asset(
    //         'assets/onboarding3.png',
    //         fit: BoxFit.cover,
    //       ));
    // }

    return PageView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      controller: controller,
      children: <Widget>[
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/onboarding1.png',
              fit: BoxFit.cover,
            )),
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/onboarding2.png',
              fit: BoxFit.cover,
            )),
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/onboarding3.png',
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}

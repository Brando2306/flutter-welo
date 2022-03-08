import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    PanelController _panelController = PanelController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        foregroundColor: Colors.red,
        shadowColor: Colors.black.withOpacity(0.4),
        backgroundColor: Colors.transparent,
        elevation: 15,
        title: Text(
          'Articles',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: CupertinoButton(
          child: Icon(CupertinoIcons.left_chevron, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CupertinoButton(
            child: Icon(CupertinoIcons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SlidingUpPanel(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/onboarding2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        minHeight: size.height * 0.4,
        maxHeight: size.height * 0.7,
        // isDraggable: true,
        controller: _panelController,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
        // physics: ClampingScrollPhysics(),
        panelBuilder: (ScrollController controller) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Text(
                  'Lorem ipsum dolor amet, consectetur adipiscing',
                  style: TextStyle(
                      fontSize: 24,
                      height: 1.25,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 16),
                Text(
                  '2h ago',
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xffA0A5B5),
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  height: 30,
                  thickness: 2,
                  color: Color(0xff303135),
                ),
                Text(
                  'I’m here to quell your health concerns: staring at a screen doesn’t damage your eyes. They won’t make you go blind, and your doctor isn’t going to worry about your health if he or she hears that you’re spending a lot of time in front of them. However, you might feel uncomfortable after a long time in front of a backlight, and you might even experience the symptoms of Computer Vision Syndrome, a fancy name for the eye strain and discomfort monitors can cause.',
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xffA0A5B5),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20),
                Text(
                  'You could try adjusting your entire monitor and desk setup to remedy your pain, or you could use moistening eyedrops. The 20-20-20 rule also exists, which dictates that after 20 minutes of screen staring, you should stare at something 20 feet away for 20 seconds. Take a break. Those blue light-filtering glasses you bought could help, too, but.',
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xffA0A5B5),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        },
        onPanelClosed: () {},
        onPanelOpened: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final VoidCallback action;

  const CardWidget({Key key, @required this.action}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 24),
      child: GestureDetector(
        onTap: action,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/home2.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'Use these camping tips, tricks and hacks to make...',
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                  ),
                  Text(
                    'Camping connects you with the quiet majesty of nature, allowing....',
                    style: TextStyle(
                        height: 1.5,
                        color: Color(0xff767984),
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

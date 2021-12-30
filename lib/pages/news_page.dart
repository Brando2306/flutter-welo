import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welo/pages/detail_page.dart';
import 'package:welo/widgets/card_widget.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CupertinoButton(
            child: Icon(
              CupertinoIcons.left_chevron,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'News',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              height: 1.5,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 24),
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CardWidget(
                action: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => DetailPage()));
                },
              );
            },
          ),
        ));
  }
}

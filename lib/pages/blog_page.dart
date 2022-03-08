import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:welo/data/data.dart';
import 'package:welo/pages/detail_page.dart';
import 'package:welo/pages/events_page.dart';
import 'package:welo/pages/news_page.dart';
import 'package:welo/widgets/card_widget.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late PageController _pageController;
  double _currentPageValue = 0.0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8)
      ..addListener(
        () {
          setState(() {
            _currentPageValue = _pageController.page!;
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21),
                child: Text(
                  'Hi!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21),
                child: Text(
                  'This is our blog',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 31),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21),
                child: Text(
                  'The highlights for you',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  itemCount: itemsCard.length,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    var scale = (1 - (_currentPageValue - index).abs());

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(
                              itemsCard[index]['image'],
                            ),
                            fit: BoxFit.cover),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30 - 30 * scale,
                      ),
                      padding: EdgeInsets.zero,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailPage()));
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.3),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.3, 0.7])),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Color(0xff000000).withOpacity(0.8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    '${itemsCard[index]['time']} hours ago',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 30),
                                  child: Text(
                                    itemsCard[index]['text'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(height: 5),
                                CupertinoButton(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 10),
                                  child: Text(
                                    'Read ...',
                                    style: TextStyle(
                                        color: Color(0xff007C9C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (BuildContext context) =>
                                                DetailPage()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(itemsCard.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 8,
                    width: (index == _currentPage) ? 20 : 8,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Color(0xff1A1A1A).withOpacity(1)
                            : Color(0xff1A1A1A).withOpacity(0.6)),
                  );
                }),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News',
                      style: TextStyle(
                          color: Color(0xffA9AEBE),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) => NewsPage()));
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: Color(0xff007C9C),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                padding: EdgeInsets.zero,
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
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Events',
                      style: TextStyle(
                          color: Color(0xffA9AEBE),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    EventsPage()));
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: Color(0xff007C9C),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                padding: EdgeInsets.zero,
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
            ],
          ),
        ),
      ),
    );
  }
}

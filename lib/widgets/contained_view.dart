import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welo/pages/login_page.dart';

class ContainedView extends StatefulWidget {
  // final String titulo;
  // final String subtitulo;

  // const ContainedView({@required this.titulo, @required this.subtitulo});

  @override
  _ContainedViewState createState() => _ContainedViewState();
}

class _ContainedViewState extends State<ContainedView> {
  int _currentPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
                print(value);
              });
            },
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
          ),

          //
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Text(
                  'Lorem ipsum dolor sit amet',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 11),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Text(
                  'Donec scelerisque efficitur lorem at aliquam. Donec vel sem neque.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0,
                      wordSpacing: 0),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(3, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 8,
                    width: (index == _currentPage) ? 20 : 8,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Color(0xffFFFFFF).withOpacity(0.8)
                            : Color(0xffFFFFFF).withOpacity(0.4)),
                  );
                }),
              ),
              SizedBox(height: 24),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => LoginPage()));
                  } else {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);
                  }
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: (_currentPage == 2)
                          ? Color(0xff007C9C)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color(0xff007C9C),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  // height: MediaQuery.of(context).size.height * 0.07,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  height: 40,
                  width: 296,
                  child: Center(
                    child: Text((_currentPage == 2) ? 'Get Started' : 'Next',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
              ),
              SizedBox(height: 43),
            ],
          ),
        ],
      ),
    );
  }
}

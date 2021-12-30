import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welo/pages/blog_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.82),
        title: Text(
          'Enter your email',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xff303135),
          ),
        ),
        elevation: 1,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 50),
            // Center(
            //   child: Text(
            //     'Enter your email',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w700,
            //       fontSize: 16,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 21),
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    'Hi!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/saludo.png',
                    fit: BoxFit.cover,
                    height: 35,
                  )
                ],
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                'Login with your email and password',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xffA9AEBE)),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 34),
            CupertinoFormRow(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: CupertinoTextFormFieldRow(
                padding: EdgeInsets.zero,
                placeholder: 'Email',
                placeholderStyle: GoogleFonts.poppins(
                  color: Color(0xffA9AEBE),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
            SizedBox(height: 15),
            CupertinoFormRow(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: CupertinoTextFormFieldRow(
                padding: EdgeInsets.zero,
                placeholder: 'Password',
                placeholderStyle: GoogleFonts.poppins(
                  color: Color(0xffA9AEBE),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
            // SizedBox(height: 291),
            Expanded(child: Container()),
            Center(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => BlogPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff007C9C),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 40,
                  width: 296,
                  child: Center(
                    child: Text('Continue',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 43),
          ],
        ),
      ),
    );
  }
}

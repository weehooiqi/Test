import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Profile extends StatefulWidget {
  static const routeName = '/bottomNav';

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  Widget textfield({@required String hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 60,
        child: TextField(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                letterSpacing: 2,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              fillColor: Colors.white30,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                     height: 340,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textfield(hintText: 'First Name'),
                        textfield(hintText: 'Badge ID'),
                        textfield(hintText: 'Position'),
                        textfield(hintText: 'Email Address'),
                      ],
                    ),
                  )
                ]),
                CustomPaint(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  painter: HeaderCurvedContainer(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 32,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('image/background.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Center(
    //           child: SizedBox(
    //             height: 180,
    //             width: 180,
    //             child: Stack(fit: StackFit.expand, children: [
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0, vertical: 20.0),
    //                 child: CircleAvatar(
    //                   backgroundImage: AssetImage(""),
    //                 ),
    //               ),
    //             ]),
    //           ),
    //         ),
    //         SizedBox(
    //           child: Text(
    //             'Wee Hooi Qi',
    //             style: TextStyle(
    //
    //             ),
    //           ),
    //
    //         ),
    //
    //         RaisedButton(
    //           onPressed: () {
    //             Navigator.of(context)
    //                 .push(MaterialPageRoute(builder: (context) => LogIn()));
    //           },
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFF607D8B);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:tggd/bottomNav.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LogIn extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // return Stack(
    //   children: [
    //     Scaffold(
    //       //backgroundColor: Colors.transparent,
    //       resizeToAvoidBottomInset: false,
    //       body: SingleChildScrollView(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             SizedBox(
    //               height: size.width * 0.1,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 30.0, vertical: 30.0),
    //               child: Center(
    //                   child: Image(
    //                 image: AssetImage('image/TGGD.png'),
    //               )
    //                   // child: ClipOval(
    //                   //   child: BackdropFilter(
    //                   //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    //                   //     child: CircleAvatar(
    //                   //       radius: size.width * 0.14,
    //                   //       backgroundColor: Colors.grey[400].withOpacity(
    //                   //         0.4,
    //                   //       ),
    //                   //       child: Icon(
    //                   //         FontAwesomeIcons.user,
    //                   //         color: Colors.white,
    //                   //         size: size.width * 0.1,
    //                   //       ),
    //                   //     ),
    //                   //   ),
    //                   // ),
    //                   ),
    //             ),
    //             SizedBox(
    //               height: size.width * 0.1,
    //             ),
    //             Center(
    //               child: Column(
    //                 children: [
    //                   TextInputField(
    //                     icon: FontAwesomeIcons.envelope,
    //                     hint: 'Email',
    //                     inputType: TextInputType.emailAddress,
    //                     inputAction: TextInputAction.next,
    //                   ),
    //                   TextInputField(
    //                     icon: FontAwesomeIcons.lock,
    //                     hint: 'Password',
    //                     inputType: TextInputType.visiblePassword,
    //                     inputAction: TextInputAction.next,
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               height: 40,
    //             ),
    //             Container(
    //               height: size.height * 0.08,
    //               width: size.width * 0.6,
    //
    //               child: RaisedButton(
    //                 color: Colors.lightBlue[900],
    //                 onPressed: () {
    //                   Navigator.of(context).push(
    //                       MaterialPageRoute(builder: (context) => BottomNav()));
    //                 },
    //                 child: Text("Log In",
    //                     style: TextStyle(
    //                         fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.white)),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
    return FlutterLogin(
      title: '',
      logo: 'image/TGGD.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNav(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}

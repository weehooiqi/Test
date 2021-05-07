// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tggd/pallet.dart';
// import 'dart:async';
// import 'User.dart';
// import 'service.dart';
//
// class UserFilterDemo extends StatefulWidget {
//   const UserFilterDemo({
//     Key key,
//     @required this.size,
//   }) : super(key: key);
//
//   final Size size;
//
//   final String title = "Filter List Demo";
//
//   @override
//   UserFilterDemoState createState() => UserFilterDemoState();
// }
//
// class Debouncer {
//   final int milliseconds;
//   VoidCallback action;
//   Timer _timer;
//
//   Debouncer({this.milliseconds});
//
//   run(VoidCallback action) {
//     if (null != _timer) {
//       _timer.cancel();
//     }
//     _timer = Timer(Duration(milliseconds: milliseconds), action);
//   }
// }
//
// class UserFilterDemoState extends State<UserFilterDemo> {
//   // https://jsonplaceholder.typicode.com/users
//
//   final _debouncer = Debouncer(milliseconds: 500);
//   List<User> users = List();
//   List<User> filteredUsers = List();
//
//   @override
//   void initState() {
//     super.initState();
//     Services.getUsers().then((usersFromServer) {
//       setState(() {
//         users = usersFromServer;
//         filteredUsers = users;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         elevation: 0.0,
//         automaticallyImplyLeading: false,
//         title: Text(
//           'TGGD First Aid - Home',
//           style: GoogleFonts.josefinSans(
//               fontWeight: FontWeight.normal, fontSize: 20),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(bottom: kDefaultPadding * 2),
//               height: h * 0.2,
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(
//                         left: kDefaultPadding,
//                         right: kDefaultPadding,
//                         bottom: 36 + kDefaultPadding),
//                     height: h * 0.2 - 27,
//                     decoration: BoxDecoration(
//                       color: primaryColor,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(36),
//                         bottomRight: Radius.circular(36),
//                       ),
//                     ),
//
//                     child: Row(
//                       children: <Widget>[
//                         Text('Hi Hooi Qi!',
//                             style: Theme.of(context).textTheme.headline5.copyWith(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 20),
//                       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                       height: 50,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(0, 10),
//                               blurRadius: 20,
//                               color: primaryColor.withOpacity(0.23),
//                             ),
//                           ]),
//                       child: Row(
//                         children: <Widget>[
//                           Expanded(
//                             child: TextField(
//                               onChanged: (string) {
//                                 _debouncer.run(() {
//                                   setState(() {
//                                     filteredUsers = users
//                                         .where((u) => (u.name
//                                                 .toLowerCase()
//                                                 .contains(string.toLowerCase()) ||
//                                             u.email
//                                                 .toLowerCase()
//                                                 .contains(string.toLowerCase())))
//                                         .toList();
//                                   });
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 hintText: "Search",
//                                 hintStyle: TextStyle(
//                                   color: primaryColor.withOpacity(0.5),
//                                 ),
//                                 enabledBorder: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                           SvgPicture.asset('image/search.svg'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: kDefaultPadding),
//               child: Row(
//                 children: <Widget>[
//                   TitleWithCustomUnderLine(text: "Factory"),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.all(10.0),
//                 itemCount: filteredUsers.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             filteredUsers[index].name,
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.0,
//                           ),
//                           Text(
//                             filteredUsers[index].email.toLowerCase(),
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class TitleWithCustomUnderLine extends StatelessWidget {
//   const TitleWithCustomUnderLine({
//     Key key,
//     this.text,
//   }) : super(key: key);
//
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 24,
//       child: Stack(
//         children: <Widget>[
//           Text(
//             text,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               margin: EdgeInsets.only(right: kDefaultPadding / 4),
//               height: 7,
//               color: primaryColor.withOpacity(0.2),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

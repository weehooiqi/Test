// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tggd/pallet.dart';
// import 'package:tggd/showFirstAidKid.dart';
// import 'dart:async';
// import 'user.dart';
// import 'service.dart';
//
// class HeaderWithSearch extends StatefulWidget {
//   const HeaderWithSearch({
//     Key key,
//     @required this.size,
//   }) : super(key: key);
//
//   final Size size;
//
//   final String title = "Filter List Demo";
//
//   @override
//   _HeaderWithSearch createState() => _HeaderWithSearch();
// }
//
//
// class _HeaderWithSearch extends State<HeaderWithSearch> {
//   // https://jsonplaceholder.typicode.com/users
//
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
//                     child: Row(
//                       children: <Widget>[
//                         Text('Hi Hooi Qi!',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline5
//                                 .copyWith(
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
//                       padding:
//                       EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
//
//
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
//               padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               child: Row(
//                 children: <Widget>[
//                   TitleWithCustomUnderLine(text: "Factory"),
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
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

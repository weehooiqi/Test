// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'User.dart';
// import 'Service.dart';
//
// class User12 extends StatefulWidget {
//   User12() : super();
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
// class UserFilterDemoState extends State<User12> {
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
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(15.0),
//               hintText: 'Filter by name or email',
//             ),
//             onChanged: (string) {
//               _debouncer.run(() {
//                 setState(() {
//                   filteredUsers = users
//                       .where((u) => (u.name
//                       .toLowerCase()
//                       .contains(string.toLowerCase()) ||
//                       u.email.toLowerCase().contains(string.toLowerCase())))
//                       .toList();
//                 });
//               });
//             },
//           ),
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.all(10.0),
//               itemCount: filteredUsers.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   child: Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           filteredUsers[index].name,
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5.0,
//                         ),
//                         Text(
//                           filteredUsers[index].email.toLowerCase(),
//                           style: TextStyle(
//                             fontSize: 14.0,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
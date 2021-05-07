import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tggd/bottomNav.dart';
import 'package:tggd/equipment.dart';
import 'package:tggd/showFirstAidKid.dart';
import 'package:tggd/user.dart';

class Consumables extends StatefulWidget {
  @override
  _Consumables createState() => _Consumables();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _Consumables extends State<Consumables> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<User> users = List();
  List<User> filteredUsers = List();

  @override
  void initState() {
    super.initState();
    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  bool _visible = false;

  File imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a Choice!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                        child: Text("Camera"),
                        onTap: () {
                          _openCamera(context);
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget textfield({@required String hintText}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 4,
        shadowColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          readOnly: true,
          enabled: false,
          textAlign: TextAlign.center,
          //textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                letterSpacing: 2,
                color: Colors.blueGrey,
                //fontWeight: FontWeight.bold,
                fontSize: 18),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  bool pressed = false;

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No Image Selected!");
    } else {
      return Image.file(imageFile, width: 200, height: 200);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    //double newheight = height - padding.top - padding.bottom;

    return Stack(
      children: <Widget>[
        Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              'Consumables',
              style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.normal, fontSize: 20),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                PageView.builder(
                  //padding: EdgeInsets.all(12.0),
                  itemCount: filteredUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              textfield(hintText: filteredUsers[index].name),
                              textfield(hintText: filteredUsers[index].email),
                              textfield(hintText: filteredUsers[index].username),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Material(
                                  elevation: 4,
                                  shadowColor: Colors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    //height: 200,
                                    width: double.infinity,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Condition?',
                                            style: TextStyle(
                                                letterSpacing: 2,
                                                color: Colors.blueGrey,
                                                fontSize: 18),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                RaisedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _visible = false;
                                                    });
                                                  },
                                                  child: Text('Yes'),
                                                ),
                                                SizedBox(width: 30),
                                                RaisedButton(
                                                  child: Text('No'),
                                                  onPressed: () {
                                                    setState(() {
                                                      _visible = true;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            //visible: false,
                                            visible: _visible,
                                            child: Container(
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  hintText: "Remarks",
                                                  labelText: "Please Fill In",
                                                  hintStyle: TextStyle(
                                                      letterSpacing: 2,
                                                      color: Colors.blueGrey,
                                                      fontSize: 18),
                                                  labelStyle: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Material(
                                  elevation: 4,
                                  shadowColor: Colors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Container(
                                        // height: 100,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            _decideImageView(),
                                            RaisedButton(
                                              onPressed: () {
                                                _showChoiceDialog(context);
                                              },
                                              child: Text("Upload Image"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // body: SingleChildScrollView(
          //   child: SafeArea(
          //     child: Stack(
          //       children: [
          //         Column(children: [
          //           Container(
          //             width: double.infinity,
          //             margin: EdgeInsets.symmetric(horizontal: 10),
          //             child: Column(
          //               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 textfield(hintText: 'Serial No'),
          //                 textfield(hintText: 'Unit'),
          //                 textfield(hintText: 'Consumables'),
          //                 //textfield(hintText: 'Condition?')
          //                 Padding(
          //                   padding: const EdgeInsets.all(10.0),
          //                   child: Material(
          //                     elevation: 4,
          //                     shadowColor: Colors.blueGrey,
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(10),
          //                     ),
          //                     child: Container(
          //                       //height: 200,
          //                       width: double.infinity,
          //                       margin: EdgeInsets.symmetric(horizontal: 10),
          //                       child: Center(
          //                         child: Column(
          //                           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.center,
          //                           children: <Widget>[
          //                             SizedBox(
          //                               height: 20,
          //                             ),
          //                             Text(
          //                               'Condition?',
          //                               style: TextStyle(
          //                                   letterSpacing: 2,
          //                                   color: Colors.blueGrey,
          //                                   fontSize: 18),
          //                             ),
          //                             Container(
          //                               alignment: Alignment.center,
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.center,
          //                                 children: <Widget>[
          //                                   RaisedButton(
          //                                     onPressed: () {
          //                                       setState(() {
          //                                         _visible = false;
          //                                       });
          //                                     },
          //                                     child: Text('Yes'),
          //                                   ),
          //                                   SizedBox(width: 30),
          //                                   RaisedButton(
          //                                     child: Text('No'),
          //                                     onPressed: () {
          //                                       setState(() {
          //                                         _visible = true;
          //                                       });
          //                                     },
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             Visibility(
          //                               //visible: false,
          //                               visible: _visible,
          //                               child: Container(
          //                                 child: TextField(
          //                                   textAlign: TextAlign.center,
          //                                   decoration: InputDecoration(
          //                                     hintText: "Remarks",
          //                                     labelText: "Please Fill In",
          //                                     hintStyle: TextStyle(
          //                                         letterSpacing: 2,
          //                                         color: Colors.blueGrey,
          //                                         fontSize: 18),
          //                                     labelStyle: TextStyle(
          //                                         color: Colors.blueGrey,
          //                                         fontSize: 12),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               height: 20,
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.all(10.0),
          //                   child: Material(
          //                     elevation: 4,
          //                     shadowColor: Colors.blueGrey,
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(10),
          //                     ),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(8.0),
          //                       child: Center(
          //                         child: Container(
          //                           // height: 100,
          //                           margin:
          //                               EdgeInsets.symmetric(horizontal: 10),
          //                           child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceAround,
          //                             children: <Widget>[
          //                               _decideImageView(),
          //                               RaisedButton(
          //                                 onPressed: () {
          //                                   _showChoiceDialog(context);
          //                                 },
          //                                 child: Text("Upload Image"),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ]),
          //       ],
          //     ),
          //   ),
          // ),
          floatingActionButton: FloatingActionButton.extended(
            //child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Equipment()));
            },
            label: Text('Next'),
          ),
        ),
      ],
    );
  }
}

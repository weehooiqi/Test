import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tggd/bottomNav.dart';

class Equipment extends StatefulWidget {
  @override
  _Equipment createState() => _Equipment();
}

class _Equipment extends State<Equipment> {
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
              )),
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
          appBar: AppBar(
            title: Text(
              'Equipment',
              style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.normal, fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Column(children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textfield(hintText: 'Serial No'),
                          textfield(hintText: 'Unit'),
                          textfield(hintText: 'Consumables'),
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
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 10),
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
                  ]),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            //child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BottomNav()));
            },
            label: Text('Next'),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tggd/pallet.dart';
import 'consumables.dart';

class FillIn extends StatefulWidget {
  @override
  _FillIn createState() => _FillIn();
}

class _FillIn extends State<FillIn> {
  DateTime _dateTime;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text(
              'First Aid Equipment',
              style: GoogleFonts.josefinSans(fontWeight: FontWeight.normal, fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: <Widget>[
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            'Please fill in: ',
                            style: kBodyText.copyWith(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    columnWidths: {
                      0: FractionColumnWidth(.5),
                      1: FractionColumnWidth(.5)
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('Date'),
                              ],
                            ),
                          ),
                        ),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(_dateTime == null
                              ? 'Click Here'
                              : DateFormat("dd-MM-yyyy").format(_dateTime)),
                          onPressed: () {
                            pressed = true;
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2222))
                                .then((date) {
                              setState(() {
                                _dateTime = date;
                              });
                            });
                          },
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('PIC/ SO'),
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('PIC/ SO'),
                              ],
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('Factory'),
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('Factory'),
                              ],
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('Bag No'),
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text('Bag No'),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            //child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Consumables()));
            },
            label: Text('Next'),
          ),
        ),
      ],
    );
  }
}

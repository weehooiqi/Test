import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user.dart';

import 'fill_in.dart';

class Show extends StatefulWidget {
  User selectedUser;

  Show(this.selectedUser);

  @override
  _Show createState() => _Show();
}

class _Show extends State<Show> {
  List users = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final List<Map<String, String>> listOfColumns = [
      {
        "Serial Number": "CS0017",
        "Unit": "6",
        "Consumables": "Crepe Bandage 15cm"
      },
      {
        "Serial Number": "CS0034",
        "Unit": "6",
        "Consumables": "Crepe Bandage 5cm"
      },
      {
        "Serial Number": "CS0036",
        "Unit": "6",
        "Consumables": "Crepe Bandage 7.5cm"
      },
      {
        "Serial Number": "CS0014",
        "Unit": "2",
        "Consumables": "Adhesive Bandage 3.8"
      },
      {
        "Serial Number": "CS0015",
        "Unit": "2",
        "Consumables": "Adhesive Bandage 2.5"
      },
      {"Serial Number": "CS0037", "Unit": "10", "Consumables": "Gauze 10cm"},
      {"Serial Number": "CS0038", "Unit": "10", "Consumables": "Gauze 7.5cm"},
      {
        "Serial Number": "CS0039",
        "Unit": "20",
        "Consumables": "Sterile Cotton"
      },
      {
        "Serial Number": "CS0040",
        "Unit": "100",
        "Consumables": "Plaster (Bandage)"
      },
      {"Serial Number": "CS0041", "Unit": "5", "Consumables": "Dressing Set"},
      {
        "Serial Number": "CS0008",
        "Unit": "1",
        "Consumables": "Normal Saline 500ml"
      },
      {"Serial Number": "CS0042", "Unit": "1", "Consumables": "Povidon"},
    ];

    final List<Map<String, String>> equipment = [
      {"Equipment": "Stretcher"},
      {"Equipment": "Stretcher Stand"},
      {"Equipment": "AED"},
      {"Equipment": "AED BOX"},
      {"Equipment": "Cervical Collar"},
      {"Equipment": "Head Block"},
      {"Equipment": "WheelChair"},
      {"Equipment": "First Aid Bag"},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List',
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.normal, fontSize: 20),
        ),
      ),
      body: PageView(
        children: [
          SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.selectedUser.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView(children: <Widget>[

                    DataTable(
                      columnSpacing: 20.0,
                      columns: [
                        DataColumn(
                          label: Container(
                            width: width * 0.27,
                            alignment: Alignment.center,
                            child: Text('Serial Number',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: width * 0.1,
                            alignment: Alignment.center,
                            child: Text('Unit',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: width * 0.4,
                            alignment: Alignment.center,
                            child: Text('Consumables',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                      rows:
                          listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                              .map(
                                (element) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Container(
                                        width: width * 0.27,
                                        alignment: Alignment.center,
                                        child: Text(element["Serial Number"]),
                                      ),
                                    ), //Extracting from Map element the value
                                    DataCell(
                                      Container(
                                        alignment: Alignment.center,
                                        width: width * 0.1,
                                        child: Text(element["Unit"]),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        width: width * 0.4,
                                        alignment: Alignment.center,
                                        child: Text(element["Consumables"]),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                    ),
                    SizedBox(height: 80),
                  ]),
                ),

              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.selectedUser.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView(children: <Widget>[
                    DataTable(
                      columnSpacing: 20.0,
                      columns: [
                        DataColumn(
                          label: Container(
                            width: width * 0.85,
                            alignment: Alignment.center,
                            child: Text('Equipments',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                      rows:
                      equipment // Loops through dataColumnText, each iteration assigning the value to element
                          .map(
                            (element) => DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Container(
                                //width: width * 0.4,
                                alignment: Alignment.center,
                                child: Text(element["Equipment"]),
                              ),
                            ),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                    SizedBox(height: 80),
                  ]),
                ),

              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        //child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FillIn()));
        },
        icon: Icon(Icons.add),
        label: Text('Submit Form'),
        //onPressed: () =>
      ),
    );
  }
}

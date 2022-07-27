// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gameon/constants.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:gameon/entities/stadium_model.dart';
import 'package:gameon/screens/data_details_screen.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  Future<List<StadiumModel>> readStadiumData() async {
    final jsonData =
        await root_bundle.rootBundle.loadString('jsonfile/stadiums.json');
    final list = jsonDecode(jsonData) as List<dynamic>;
    return list.map((e) => StadiumModel.fromJson(e)).toList();
  }

  var _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: GlobalVariables.primaryColor,
          child: Column(children: [Text('This is an blank app drawer')]),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Grounds',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(onTap: () {}, child: Image.asset('assets/Search.png')),
          InkWell(
              onTap: () {}, child: Image.asset('assets/Combined-Shape.png')),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              color: Colors.white,
              child: Column(children: [
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: GlobalVariables.primaryColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                      var dateD = date
                          .toString()
                          .substring(0, date.toString().length - 13);
                      DateData().setDate(dateD);
                      // print(date
                      //     .toString()
                      //     .substring(0, date.toString().length - 13));
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 25,
                        color: GlobalVariables.primaryColor,
                      ),
                      Text(
                        'User location Name',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ]),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 13,
                          color: GlobalVariables.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: readStadiumData(),
                //readJsonData(),
                builder: (context, snapshot) {
                  //  var items = snapshot.data as List<ProductsModel>;
                  var stadiums = snapshot.data as List<StadiumModel>;
                  //   print(snapshot);
                  if (snapshot.hasData == false) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: stadiums.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 6, right: 5, left: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DataDetailsScreen(
                                      stadium: stadiums[index])));
                            },
                            child: Container(
                              height: 250,
                              color: Color(0xffFFFFFF),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        stadiums[index].imageUrl.toString(),
                                        fit: BoxFit.fill,
                                        height: 130,
                                        width: 140,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 150),
                                          child: Text(
                                            '20 over',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 220,
                                              child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: stadiums[index]
                                                      .twentyOver!
                                                      .length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  itemBuilder:
                                                      (context, position) {
                                                    return Row(
                                                      children: [
                                                        AvailableTimeBox(
                                                          text: stadiums[index]
                                                              .twentyOver![
                                                                  position]
                                                              .time
                                                              .toString(),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 150),
                                          child: Text(
                                            '30 over',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 220,
                                              child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: stadiums[index]
                                                      .thirtyOver!
                                                      .length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  itemBuilder:
                                                      (context, position1) {
                                                    return Row(
                                                      children: [
                                                        AvailableTimeBox(
                                                          text: stadiums[index]
                                                              .thirtyOver![
                                                                  position1]
                                                              .time
                                                              .toString(),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        )
                                                      ],
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  stadiums[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black54,
                                      size: 18,
                                    ),
                                    Text(
                                        "${stadiums[index].stadiumLocation![0].state.toString()},${stadiums[index].stadiumLocation![0].country.toString()}")
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Divider(
                                    color: Colors.black45,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Pitch Type:',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            'Mat',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/Combined-Shape1.png'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Navigate',
                                            style:
                                                TextStyle(color: Colors.teal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class AvailableTimeBox extends StatefulWidget {
  final String text;

  AvailableTimeBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<AvailableTimeBox> createState() => _AvailableTimeBoxState();
}

class _AvailableTimeBoxState extends State<AvailableTimeBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      height: 30,
      width: 70,
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DateData {
  var dateData;
  void setDate(var value) {
    // value = dateData;
  }
}
/**
 Card(
                          child: Column(
                            children: [
                              Text(stadiums[index].id.toString()),
                              Text('data'),
                              Text('data'),
                              Image.network(
                                  stadiums[index].imageUrl.toString()),
                              Text(stadiums[index]
                                  .thirtyOver![0]
                                  .time
                                  .toString()),
                              Text(stadiums[index]
                                  .thirtyOver![1]
                                  .time
                                  .toString()),
                            ],
                          ),
                        );
 */
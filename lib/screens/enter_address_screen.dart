import 'package:flutter/material.dart';
import 'package:gameon/screens/data_screen.dart';
import 'package:location/location.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

import '../constants.dart';

class EnterAddressScreen extends StatefulWidget {
  EnterAddressScreen({Key? key}) : super(key: key);

  @override
  State<EnterAddressScreen> createState() => _EnterAddressScreenState();
}

class _EnterAddressScreenState extends State<EnterAddressScreen> {
  TextEditingController locationController = TextEditingController();
  void locationStatus() async {
    Location location = Location();
    PermissionStatus? permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      address();
    }
    if (permissionStatus == PermissionStatus.granted) {
      data();
      // print('granted');
    }
    if (permissionStatus == PermissionStatus.grantedLimited) {
      data();
      //  print('granted limited');
    }
  }

  void address() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (_) => EnterAddressScreen()));
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            // backgroundColor: Colors.transparent,

            child: Container(
                color: Colors.teal,
                height: 80,
                width: 10,
                child: Center(
                    child: Text(
                  'Please Enter the valid Address',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))),
          );
        });
    //     ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('text'),
    //   ),
    // );
    print('denied');
  }

  void data() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DataScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            TextButton(
              onPressed: () {
                locationStatus();
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    color: Colors.white),
              ),
            )
          ],
          elevation: 0,
        ),
        backgroundColor: GlobalVariables.primaryColor,
        body: Column(
          children: [
            SizedBox(
              height: 250,
              // color: Colors.red,
              child: Image.asset('assets/Group 176124.png'),
            ),
            Expanded(
              child: Container(
                // height: double.infinity,
                //height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Text(
                    'Enter Your Location',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "OK, at least enter your location so that we can personalize your experience.",
                    style: TextStyle(
                        fontSize: 16, color: GlobalVariables.primaryColor),
                  ),
                  Row(
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  Container(
                    // color: Colors.red,
                    height: 55,
                    padding: EdgeInsets.only(right: 20, left: 20),
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 208, 234, 232),
                      border: Border.all(color: Colors.teal, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_city_outlined),
                        SizedBox(
                          height: 55,
                          width: 300,
                          child: Center(
                            child: TextField(
                              onSubmitted: (value) {
                                // print(value);
                              },
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                              // keyboardType: TextInputType.number,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly,
                              //   LengthLimitingTextInputFormatter(10),
                              // ],
                              cursorWidth: .5,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      height: 40,
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => DataScreen()));
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 16),
                        ),
                        //  style: ButtonStyle(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: Text(
                      'Agree',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.teal),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ));
  }
}

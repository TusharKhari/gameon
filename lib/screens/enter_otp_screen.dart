import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameon/screens/data_screen.dart';
import 'package:gameon/screens/enter_address_screen.dart';
import 'package:gameon/services/location/location.dart';
import 'package:location/location.dart';

import '../constants.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

class EnterOtpScreen extends StatefulWidget {
  EnterOtpScreen({Key? key}) : super(key: key);

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  //
  void locationStatus() async {
    Location location = Location();
    PermissionStatus? permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      address();
    }
    if (permissionStatus == PermissionStatus.granted) {
      data();
      print('granted');
    }
    if (permissionStatus == PermissionStatus.grantedLimited) {
      data();
      print('granted limited');
    }
  }

  void address() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => EnterAddressScreen()));
    print('denied');
  }

  void data() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DataScreen()));
  }

  //
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
  }

  LocationService loc = LocationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.primaryColor,
        body: Column(
          children: [
            SizedBox(
              height: 250,
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
                    'Enter OTP ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '("NO NEED CLICK ON LOGIN")',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OTPTextField(controller: controller1),
                      OTPTextField(controller: controller2),
                      OTPTextField(controller: controller3),
                      OTPTextField(controller: controller4),
                    ],
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
                          loc.getLocation();
                          locationStatus();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ButtonStyle(),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}

class OTPTextField extends StatefulWidget {
  final TextEditingController controller;

  OTPTextField({Key? key, required this.controller}) : super(key: key);

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 208, 234, 232),
        border: Border.all(color: Colors.teal, width: 0.5),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SizedBox(
          height: 50,
          width: 25,
          child: TextField(
            controller: widget.controller,
            obscureText: true,
            onSubmitted: (value) {
              print(value);
            },
            style: TextStyle(
              fontSize: 18,
              color: Colors.teal,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1),
            ],
            cursorWidth: .5,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}


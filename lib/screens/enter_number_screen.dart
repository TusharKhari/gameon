import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import '../constants.dart';
import 'enter_otp_screen.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({Key? key}) : super(key: key);

  @override
  State<EnterNumberScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterNumberScreen> {
  TextEditingController phoneNoController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Hi!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Let\'s Get Started",
                    style: TextStyle(
                        fontSize: 16, color: GlobalVariables.primaryColor),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Enter Phone Number',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ("NO NEED CLICK ON GET OTP")',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
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
                        Text(
                          '+91  ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 55,
                          width: 300,
                          child: Center(
                            child: TextField(
                              controller: phoneNoController,
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
                                LengthLimitingTextInputFormatter(10),
                              ],
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EnterOtpScreen()));
                        },
                        child: Text(
                          'Get OTP',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ButtonStyle(),
                      ),
                    ),
                  ),
                  Text(
                    'Have a Pin?',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: Colors.teal),
                  )
                ]),
              ),
            ),
          ],
        ));
  }
}


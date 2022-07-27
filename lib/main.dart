import 'package:flutter/material.dart';
import 'package:gameon/screens/data_details_screen.dart';
import 'package:gameon/screens/data_screen.dart';
import 'constants.dart';
import 'screens/enter_number_screen.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors
// import 'firebase_options.dart';
/**
 
Thank you for your interest in our internship opening. As a next step, we are expecting you to complete a short assignment.

Please make screens in flutter from the below figma link. 
https://www.figma.com/file/dvzxSDRoUlyTO7CSAUKNoa/Assignment---Gameon?node-id=0%3A1

1) Use any local database and sample data for backend. 
2) Login through phone number and hardcoded PIN. OTP not required
3) Ask permission from phone to use location. If location is not given then it has to be manually provided
4) Retrieve the list of grounds in given format with different slots mentioned
5) Click on any ground listing should open the ground details page
6) All logic should be written in flutter

Let me know if you face any issues in retrieving the figma designs


Thanks,
Abhinav
Submission deadline: 28 July, 2022

 */
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.light(
          primary: GlobalVariables.primaryColor,
        )),
        home: 
        EnterNumberScreen()
      // DataScreen(),
     // DataDetailsScreen(stadium: stadium)
        );

  }
}

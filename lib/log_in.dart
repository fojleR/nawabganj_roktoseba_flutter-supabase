import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/Home.dart';
import 'package:nawabganj_roktoseba/sing_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase/supabase.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  List<DocumentSnapshot> donorData = [];
  List<Map<String, String>> donorInfo = [];
  final supabase = Supabase.instance.client;

  void fetchDonorData() async {
    try{
      final data = await supabase.from('user').select('*');
      data.forEach((element) {
        String name = element['name'] ?? '';
        String email = element['email'] ?? '';
        String bloodGroup = element['blood'] ?? '';
        String phone = element['mobile'] ?? '';
        String village = element['presentVillage'] ?? '';
        String union = element['presentUnion'] ?? '';
        String upazilla = element['presentUpazilla'] ?? '';
        String division = element['presentDivision'] ?? '';
        String district = element['presentDistrict'] ?? '';
        String gender = element['gender'] ?? '';
        String lastDonationDate = element['lastDonationDate'] ?? '';
        String lastDonationMonth = element['lastDonationMonth'] ?? '';
        String lastDonationYear = element['lastDonationYear'] ?? '';
        String admin = element['admin'] ?? '';
        String birthDate = element['birthDate'] ?? '';
        String birthMonth = element['birthMonth'] ?? '';
        String birthYear = element['birthYear'] ?? '';
        String offTime = element['offTime'].toString() ?? '';
        String cause_of_off = element['cause_for_donation_of'] ?? '';
        String offDate = element['offDate'] ?? '';
        String offMonth = element['offMonth'] ?? '';
        String offYear = element['offYear'] ?? '';
        String readyDate = element['readyDate'] ?? '';
        String readyToDonate = element['readyToDonate'] ?? '';
        donorInfo.add({
          'name': name,
          'bloodGroup': bloodGroup,
          'phone': phone,
          'village': village,
          'union': union,
          'upazilla': upazilla,
          'gender': gender,
          'lastDonationDate': lastDonationDate,
          'lastDonationMonth': lastDonationMonth,
          'lastDonationYear': lastDonationYear,
          'admin': admin,
          'birthDate': birthDate,
          'birthMonth': birthMonth,
          'birthYear': birthYear,
          'offTime': offTime,
          'cause_of_off': cause_of_off,
          'offDate': offDate,
          'offMonth': offMonth,
          'offYear': offYear,
          'email': email,
          'division': division,
          'district': district,
          'readyDate': readyDate,
          "readyToDonate": readyToDonate,
        });
      }
      );
      // print(donorInfo);
    }catch(error){
      print("Error adding document: $error");
    }
  }

  bool isPressed = false;
  TextEditingController mobileNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDonorData();
  }

  Map<String, String> loggedInUser = {};

  void handleLogin() {
    setState(() {
      isPressed = true; // Set state to true to show loading indicator
    });

    String enteredMobileNumber = mobileNumberController.text;

    // Check if the entered mobile number is empty
    if (enteredMobileNumber.isEmpty) {
      // Show an error message or handle the case where the mobile number is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Empty Mobile Number"),
            content: Text("Please enter a mobile number."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );

      // Once login operation is completed, set state back to false to hide loading indicator
      setState(() {
        isPressed = false;
      });

      return; // Exit the function without further execution
    }

    bool isMobileNumberValid = false;

    // Check if the entered mobile number exists in the donor info
    for (Map<String, String> donor in donorInfo) {
      if (donor['phone'] == enteredMobileNumber) {
        isMobileNumberValid = true;
        loggedInUser = donor;
        print(loggedInUser);
        break;
      }
    }

    if (isMobileNumberValid) {
      Navigator.pop(context);
      Navigator.pushNamed(
        context,
        '/home',
        arguments: {
          'phoneNumber':enteredMobileNumber,
          'loggedInUserInfo': loggedInUser,
        },
      );

    } else {
      // If the mobile number is invalid, show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Mobile Number"),
            content: Text("The entered mobile number does not exist."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }

    // Once login operation is completed, set state back to false to hide loading indicator
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: isPressed ? Colors.black : Colors.red[800],
      fixedSize: Size(200, 50),
      foregroundColor: Colors.white,
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "lib/assets/photos/rokotoseba_cover.png",
                // height: 100,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                          child: const Text(
                            "রক্তসেবা লগইন",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  "মোবাইল নাম্বর ",
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red, // Set the color of the star to red
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: TextField(
                            controller: mobileNumberController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'মোবাইল নাম্বর ',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: isPressed
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isPressed = true; // Set state to true to show loading indicator
                              });
                              handleLogin(); // Call the handleLogin function
                              // No need to navigate to HomeActivity here
                            },
                            child: Text("লগ ইন"),
                            style: buttonStyle,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "আপনার একাঊন্ট নেই?",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            },
                            child: Text("নতুন একাউন্ট তৈরি করুন"),
                            style: buttonStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

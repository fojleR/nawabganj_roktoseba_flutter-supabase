import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/DropdownAndLeble.dart';
import 'package:nawabganj_roktoseba/Home.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawabganj_roktoseba/log_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateProfile extends StatefulWidget {
  final String? phoneNumber;
  final Map<String, String> ? logedinUserInfo;
  UpdateProfile({Key? key, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black, backgroundColor: Colors.red[800], // Change this color for the pressed state
    // foregroundColor: Colors.white,
    fixedSize: Size(200, 50),
  );
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    loadData();
    name = widget.logedinUserInfo!['name']!;
    mobile = widget.logedinUserInfo!['phone']!;
    email = widget.logedinUserInfo!['email']!;
    blood = widget.logedinUserInfo!['bloodGroup']!;
    division = widget.logedinUserInfo!['division']!;
    district = widget.logedinUserInfo!['district']!;
    presentUpazilla = widget.logedinUserInfo!['upazilla']!;
    presentUnion = widget.logedinUserInfo!['union']!;
    presentVillage = widget.logedinUserInfo!['village']!;
    birthDate = widget.logedinUserInfo!['birthDate']!;
    birthMonth = widget.logedinUserInfo!['birthMonth']!;
    birthYear = widget.logedinUserInfo!['birthYear']!;
    gender = widget.logedinUserInfo!['gender']!;
    print("update" + name + gender);
  }

  Future<Map<String, dynamic>> loadUpazillaData() async {
    String jsonString = await rootBundle.loadString('lib/assets/roktosebaData.json');
    return json.decode(jsonString);
  }

  late List<String> allUnion = [];
  late List<String> allGram = [];

  final TextEditingController nameController = TextEditingController() ;
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController birthMonthController = TextEditingController();
  final TextEditingController birthYearController = TextEditingController();
  final TextEditingController presentUpazillaController = TextEditingController();
  final TextEditingController presentUnionController = TextEditingController();
  final TextEditingController presentVillageController = TextEditingController();
  final TextEditingController permanentUpazillaController = TextEditingController();
  final TextEditingController permanentUnionController = TextEditingController();
  final TextEditingController permanentVillageController = TextEditingController();


  late String name;
  late String mobile;
  late String email;
  late String blood;
  late String gender;
  late String birthDate;
  late String birthMonth;
  late String birthYear;
  late String presentUpazilla;
  late String presentUnion;
  late String presentVillage;
  late String permanentUpazilla;
  late String permanentUnion;
  late String permanentVillage;
  var division = "";
  var district = "";

  void loadData() async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/roktosebaData.json');
      Map<String, dynamic> data = json.decode(jsonString);
      // Handle data loading
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  void loadDistrictData(String division) async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/bangladesh.json');
      Map<String, dynamic> data = json.decode(jsonString);

      if (data.containsKey(division)) {
        Map<String, dynamic> divisionData = data[division];

        // Get the keys of the divisionData map, which represent the districts
        List<String> districtsList = divisionData.keys.toList();

        setState(() {
          allDistrict = districtsList;
        });
        print('District List: $allDistrict');

      } else {
        print('Division $division not found in data.');
      }
    } catch (e) {
      print('Error loading district data: $e');
    }
  }
  void loadUpazillasData(String division, String district) async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/bangladesh.json');
      Map<String, dynamic> data = json.decode(jsonString);

      if (data.containsKey(division)) {
        Map<String, dynamic> divisionData = data[division];
        if (divisionData.containsKey(district)) {
          List<dynamic> upazillaList = divisionData[district];

          setState(() {
            allUpazilla = upazillaList.cast<String>().toList();
          });
          print('Upazilla List: $allUpazilla');

        } else {
          print('District $district not found in data for division $division.');
        }
      } else {
        print('Division $division not found in data.');
      }
    } catch (e) {
      print('Error loading upazilla data: $e');
    }
  }

  void loadUnionData(String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();

    if (data.containsKey('roktosebaData') && data['roktosebaData'].containsKey(upazilla)) {
      List<dynamic> unionsData = data['roktosebaData'][upazilla]['unions'];
      List<String> unionsList = unionsData.map((union) => union['name'].toString()).toList();

      setState(() {
        allUnion = unionsList;
      });

      print('Union List: $unionsList');
    } else {
      print('Upazilla $upazilla not found in data or no unions found. Treating $upazilla as a union.');
      // Treat the upazilla itself as a union
      setState(() {
        allUnion = [upazilla];
      });
    }
  }



  void loadGramData(String union, String upazilla) async {
    Map<String, dynamic>? data = await loadUpazillaData();

    if (data != null && data.containsKey('roktosebaData')) {
      Map<String, dynamic>? upazillaData = data['roktosebaData'][upazilla];

      if (upazillaData != null) {
        List<dynamic> unions = upazillaData['unions'];

        // Find the specified union
        var specifiedUnion = unions.firstWhere((u) => u['name'] == union, orElse: () => null);

        if (specifiedUnion != null) {
          List<dynamic> villages = specifiedUnion['villages'];

          List<String> gramsList = villages.map((village) => village.toString()).toList();

          setState(() {
            allGram = gramsList;
          });

          print('Gram List: $gramsList');
        } else {
          print('Union $union not found in data or no grams found. Treating $union as a gram.');
          // Treat the union itself as a gram
          setState(() {
            allGram = [union];
          });
        }
      } else {
        setState(() {
          allGram = [union];
        });
        print('Upazilla $upazilla not found in data.');
      }
    } else {
      setState(() {
        allGram = [union];
      });
      print('Error loading upazilla data or roktosebaData key not found.');
    }
  }

  void loadCurrentUnionData(String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Upazilla Data: $data');

    if (data.containsKey('roktosebaData') && data['roktosebaData'].containsKey(upazilla)) {
      List<dynamic> unionsData = data['roktosebaData'][upazilla]['unions'];
      List<String> unionsList = unionsData.map((union) => union['name'].toString()).toList();

      setState(() {
        currentAllUnion = unionsList;
      });

      // print('Union List: $unionsList');
    } else {
      print('Upazilla $upazilla not found in data.');
    }
  }
  void loadPermanentUnionData(String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Upazilla Data: $data');

    if (data.containsKey('roktosebaData') && data['roktosebaData'].containsKey(upazilla)) {
      List<dynamic> unionsData = data['roktosebaData'][upazilla]['unions'];
      List<String> unionsList = unionsData.map((union) => union['name'].toString()).toList();

      setState(() {
        permanentAllUnion= unionsList;
      });

      // print('Union List: $unionsList');
    } else {
      print('Upazilla $upazilla not found in data.');
    }
  }

  void loadCurrentGramData(String union, String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Union Data: $data');

    if (data.containsKey('roktosebaData')) {
      Map<String, dynamic> upazillaData = data['roktosebaData'][upazilla];

      if (upazillaData != null) {
        List<dynamic> unions = upazillaData['unions'];

        // Find the specified union
        var specifiedUnion = unions.firstWhere((u) => u['name'] == union, orElse: () => null);

        if (specifiedUnion != null) {
          List<dynamic> villages = specifiedUnion['villages'];

          List<String> gramsList = villages.map((village) => village.toString()).toList();

          setState(() {
            currentAllGram = gramsList;
          });

          // print('Gram List: $gramsList');
        } else {
          print('Union $union not found in data.');
        }
      } else {
        print('Upazilla $upazilla not found in data.');
      }
    } else {
      print('roktosebaData key not found in data.');
    }
  }
  void loadPermanentGramData(String union, String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Union Data: $data');

    if (data.containsKey('roktosebaData')) {
      Map<String, dynamic> upazillaData = data['roktosebaData'][upazilla];

      if (upazillaData != null) {
        List<dynamic> unions = upazillaData['unions'];

        // Find the specified union
        var specifiedUnion = unions.firstWhere((u) => u['name'] == union, orElse: () => null);

        if (specifiedUnion != null) {
          List<dynamic> villages = specifiedUnion['villages'];

          List<String> gramsList = villages.map((village) => village.toString()).toList();

          setState(() {
            currentAllGram = gramsList;
          });

          // print('Gram List: $gramsList');
        } else {
          print('Union $union not found in data.');
        }
      } else {
        print('Upazilla $upazilla not found in data.');
      }
    } else {
      print('roktosebaData key not found in data.');
    }
  }

  final List<String> currentAllUpazilas = [

  ];
  List<String> currentAllUnion = [

  ];

  List <String> currentAllGram = [

  ];
  final List<String> permanentAllUpazilas = [

  ];
  List<String> permanentAllUnion = [

  ];

  List <String>permanentAllGram = [

  ];


  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'AB+',
    'AB-',
    'B+',
    'B-',
    'O+',
    'O-',
    'Bombay Blood Group',
    'Unknown'
  ];
  final List<String> Upazilla = [
    'A+',
    'A-',
    'AB+',
    'AB-',
    'B+',
    'B-',
    'O+',
    'O-',
    'Bombay Blood Group',
    'Unknown'
  ];
  List<String> allUpazilla = [

  ];
  List<String> allDistrict = [];
  List<String> allDivision = [
    'রংপুর',
    'রাজশাহী',
    'ঢাকা',
    'চট্টগ্রাম',
    'বরিশাল',
    'খুলনা',
    'সিলেট',
    'ময়মনসিংহ'

  ];

  final List<String> days = List.generate(31, (index) => (index + 1).toString());
  final List<String> years = List.generate(40, (index) => (index + 1980).toString());
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];





  void updateBloodGroup(String value) {
    blood = value;
    print(blood);
  }
  void updateDivision(String value) {
    setState(() {
      division = value;
      district = ''; // Reset district value
      allDistrict = []; // Clear district dropdown items
      allUpazilla = []; // Clear upazilla dropdown items
      allUnion = []; // Clear union dropdown items
      allGram = []; // Clear gram dropdown items
    });
    loadDistrictData(division);
  }

  void updateDistrict(String value){
    setState(() {
      district = value;
      // Clear district dropdown items
      allDivision = [division];
      allUpazilla = []; // Clear upazilla dropdown items
      allUnion = []; // Clear union dropdown items
      allGram = []; // Clear gram dropdown items
    });
    loadUpazillasData(division, district);
  }
  void updatePresentUpazilla(String value){
    setState(() {
      presentUpazilla = value;
      // Clear district dropdown items
      allDistrict = [district];
      // Clear upazilla dropdown items
      allUnion = []; // Clear union dropdown items
      allGram = []; // Clear gram dropdown items
    });
    loadUnionData(presentUpazilla);
  }
  void updatePresentUnion(String value){
    setState(() {
      presentUnion = value;
      // Clear district dropdown items
      allUpazilla = [presentUpazilla];

      allGram = []; // Clear gram dropdown items
    });
    loadGramData(presentUnion, presentUpazilla);
  }
  void updatePresentVillage(String value){
    setState(() {
      presentVillage = value;
      // Clear district dropdown items
      allUnion = [presentUnion];
      // Clear gram dropdown items
    });

  }
  void updatePermanentUpazilla(String value){
    permanentUpazilla = value;
    loadPermanentUnionData(permanentUpazilla);
  }
  void updatePermanentUnion(String value){
    permanentUnion = value;
    loadPermanentGramData(permanentUnion, permanentUpazilla);
  }
  void updatePermanentVillage(String value){
    permanentVillage = value;
  }
  void updateBirthDate(String value){
    birthDate = value;
  }
  void updateBirthMonth(String value){
    birthMonth = value;
  }
  void updateBirthYear(String value){
    birthYear = value;
  }
  void updateGender(String value){
    gender = value;
  }

  void updatePresentAddress(List<String> address) {
    presentUpazilla = address[0];
    presentUnion = address[1];
    presentVillage = address[2];
  }

  void updatePermanentAddress(List<String> address) {
    permanentUpazilla = address[0];
    permanentUnion = address[1];
    permanentVillage = address[2];
  }
  var lastDonationDate = "";
  var lastDonationMonth = "";
  var lastDonationYear = "";
  void updateLastDonationDate(String value) {
    lastDonationDate = value;
  }

  void updateLastDonationMonth(String value) {
    lastDonationMonth = value;
  }

  void updateLastDonationYear(String value) {
    lastDonationYear = value;
  }



  Future<void> updateData(BuildContext context, String phoneNumber) async {
    print("check update");
    try {
      await supabase.from('user')
          .update({
        'id': mobile,
        'name': name,
        'mobile': mobile,
        'email': email,
        'blood': blood,
        'presentVillage': presentVillage,
        'presentUnion': presentUnion,
        'presentUpazilla': presentUpazilla,
        'birthDate': birthDate,
        'birthMonth': birthMonth,
        'birthYear': birthYear,
        'gender': gender,
        'lastDonationDate': widget.logedinUserInfo!['lastDonationDate'],
        'lastDonationMonth': widget.logedinUserInfo!['lastDonationMonth'],
        'lastDonationYear': widget.logedinUserInfo!['lastDonationYear'],
        'admin': widget.logedinUserInfo!['admin'],
        'readyToDonate': widget.logedinUserInfo!['readyToDonate'],
        'offTime': widget.logedinUserInfo!['offTime'],
        'cause_for_donation_of': widget.logedinUserInfo!['cause_of_off'],
        'offDate': widget.logedinUserInfo!['offDate'],
        'offMonth': widget.logedinUserInfo!['offMonth'],
        'offYear': widget.logedinUserInfo!['offYear'],
        'presentDistrict': district,
        'presentDivision': division,
        'readyDate': widget.logedinUserInfo!['readyDate'],
      })
          .eq('id', phoneNumber);
      print("Data updated successfully");
    } catch (error) {
      // Handle error if any
      print("Error updating document: $error");
    }
  }



  void handleSubmit(BuildContext context) async {
    //Show circular progress indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Get data from text controllers
    name = nameController.text;
    mobile = mobileController.text;
    email = emailController.text;

    // Validate mobile number format and other required fields...

    // Call updateData to update the data
    print(mobile + " " + name + " " + blood + widget.logedinUserInfo!['phone']!);
    await updateData(context, widget.logedinUserInfo!['phone']!);
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
  }


  // Other methods for loading union and gram data...

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.logedinUserInfo!['name']!;
    mobileController.text = widget.logedinUserInfo!['phone']!;
    emailController.text = widget.logedinUserInfo!['email']!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: RefreshIndicator(
        onRefresh: () async {
          // Navigate to the same page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UpdateProfile(logedinUserInfo: widget.logedinUserInfo)), // Replace YourPage with the actual name of your page class
          );
        },
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Image.asset(
                          "lib/assets/photos/rokotoseba_cover.png",
                          // height: 100,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
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
                              "রক্তসেবা রেজিস্ট্রেশন",
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
                                    "নাম ",
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
                            padding:  EdgeInsets.all(16.0),
                            child: TextField(
                              controller: nameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'নাম ',
                              ),

                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "মোবাইল নাম্বর (ইংরেজী) ",
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
                          const Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "মেয়েদের মোবাইল নাম্বর গোপন থাকবে",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.red, // Set the text color to red
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(16.0),
                            child: TextField(
                              controller: mobileController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'মোবাইল নাম্বর ',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "ইমেইল (যদি থাকে) ",
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(16.0),
                            child: TextField(
                              controller: emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'ইমেইল ',
                              ),
                            ),
                          ),
                          DropdownAndLabel(
                            label: "রক্তের গ্রুপ ",
                            isRequired: true,
                            items: bloodGroups,
                            placeholder: widget.logedinUserInfo!['bloodGroup']!,
                            onChanged: updateBloodGroup, // Pass the callback function
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "জন্ম তারিখ (গোপন থাকবে)",  // Title Name
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        DropdownAndLabel(
                                            label: "তারিখ",
                                            isRequired: true,
                                            items: days,
                                            placeholder: widget.logedinUserInfo!['birthDate']!,
                                            onChanged: updateBirthDate
                                        ),
                                        DropdownAndLabel(label: "মাস", isRequired: true, items: months, placeholder: widget.logedinUserInfo!['birthMonth']! , onChanged: updateBirthMonth),
                                        DropdownAndLabel(label: "সাল", isRequired: true, items: years, placeholder: widget.logedinUserInfo!['birthYear']!, onChanged: updateBirthYear),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "বর্তমান ঠিকানা",  // Title Name
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        DropdownAndLabel(label: "বিভাগ", isRequired: true, placeholder: widget.logedinUserInfo!['division']!, items: allDivision, onChanged: updateDivision),
                                        DropdownAndLabel(label: "জেলা", isRequired: true, placeholder: widget.logedinUserInfo!['district']!, items: allDistrict, onChanged: updateDistrict),
                                        DropdownAndLabel(label: "উপজেলা", isRequired: true, placeholder: widget.logedinUserInfo!['upazilla']!, items: allUpazilla, onChanged: updatePresentUpazilla),
                                        DropdownAndLabel(label: "ইউনিয়ন", isRequired: true,placeholder: widget.logedinUserInfo!['union']!, items: allUnion, onChanged: updatePresentUnion),
                                        DropdownAndLabel(label: "গ্রাম", isRequired: true,placeholder: widget.logedinUserInfo!['village']!, items: allGram, onChanged: updatePresentVillage),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.all(16.0),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       const Text(
                          //         "স্থায়ী ঠিকানা",  // Title Name
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 18.0,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.all(16.0),
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //             border: Border.all(
                          //               color: Colors.red,
                          //               width: 1.0,
                          //             ),
                          //             borderRadius: BorderRadius.circular(8.0),
                          //           ),
                          //           child:  Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               DropdownAndLabel(label: "উপজেলা", isRequired: true, items: permanentAllUpazilas, onChanged: updatePermanentUpazilla,),
                          //               DropdownAndLabel(label: "ইউনিয়ন", isRequired: true, items: permanentAllUnion, onChanged: updatePermanentUnion),
                          //               DropdownAndLabel(label: "গ্রাম", isRequired: true, items: permanentAllGram, onChanged: updatePermanentVillage),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          DropdownAndLabel(label: "জেন্ডার ", isRequired: true, placeholder: widget.logedinUserInfo!['gender']!, items: ["পুরুষ", "মহিলা"], onChanged: updateGender),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                handleSubmit(context);
                              },
                              child: Text("সাবমিট করুন", style: TextStyle(color: Colors.white)),
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
      ),
    );
  }

}

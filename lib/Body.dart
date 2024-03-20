import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawabganj_roktoseba/DropdownAndLeble.dart';
import 'package:nawabganj_roktoseba/cardList.dart';
import 'package:nawabganj_roktoseba/customCard.dart';
import 'dropdwon_button.dart';
import 'package:nawabganj_roktoseba/calender.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Body extends StatefulWidget {
  final Map<String, String>? loggedInUserInfo;

  Body({Key? key, this.loggedInUserInfo}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}


class _BodyState extends State<Body> {
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.red[800],
    foregroundColor: Colors.white,
    fixedSize: Size(200, 50),
  );
  Future<Map<String, dynamic>> loadUpazillaData() async {
    String jsonString = await rootBundle.loadString('lib/assets/roktosebaData.json');
    return json.decode(jsonString);
  }
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/roktosebaData.json');
      Map<String, dynamic> data = json.decode(jsonString);
      // print('Parsed Data: $data');
    } catch (e) {
      print('Error loading JSON data: $e');
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



  List<String> allUpazilla = [
    'নবাবগঞ্জ',
    'বিরামপুর',
    'ফুলবাড়ী',
    'হাকিমপুর',
    'ঘোড়াঘাট'
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

  List<String> allUnion = [
    'বড়গাছি',
    'বড়পুর',
  ];

  List <String> allGram = [
    'বড়গাছি',
    'বড়পুর',
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
    'Bombay Blood Group'
  ];
  final monthMap = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    '11': 11,
    '12': 12,
  };

  var blood = "";
  var upazilla = "";
  var union = "";
  var gram = "";
  var division = "";
  var district = "";

  List<DocumentSnapshot> donorData = [];

  void updateBlood(String value) {
    blood = value;
  }

  void updateDivision(String value) {
    setState(() {
      division = value;
      district = ''; // Reset district value
      upazilla = '';
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
      upazilla = '';
       // Clear district dropdown items
      allDivision = [division];
      allUpazilla = []; // Clear upazilla dropdown items
      allUnion = []; // Clear union dropdown items
      allGram = []; // Clear gram dropdown items
    });
    loadUpazillasData(division, district);
  }

  void updateUpazilla(String value) {
    setState(() {
      upazilla = value;
      union = widget.loggedInUserInfo!['union'] ?? '';
      gram = widget.loggedInUserInfo!['village'] ?? '';
      allDistrict = [district];
      allUnion = []; // Clear union dropdown items
      allGram = []; // Clear gram dropdown items
    });
    loadUnionData(upazilla);
  }

  void updateUnion(String value) {
    setState(() {
      union = value;
      allUpazilla = [upazilla];
      allGram = []; // Clear gram dropdown items
    });
    loadGramData(union, upazilla); // Call loadGramData method with the selected union
  }


  void updateGram(String value) {
    gram = value;
  }

  void handleButton(BuildContext context) {
    if (blood.isEmpty || upazilla.isEmpty || union.isEmpty || gram.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("দয়া করে সব তথ্য পূরণ করুন।"),
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
    } else {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Loading..."),
                ],
              ),
            ),
          );
        },
      );
      print(blood + upazilla + union + gram);
      fetchDonorData(blood, upazilla, union, gram);
    }
  }



  // List <String > donorInfo = [
  //   "Name: মোঃ আবু হানিফ",
  //   "Blood Group: A+",
  //   "Phone: 01712345678",
  //   "Address: বড়গাছি, নবাবগঞ্জ",
  // ];
  final supabase = Supabase.instance.client;
  void fetchDonorData(String bloodGroup, String upazilla, String union, String gram) async {
    if (!mounted) return;
    final query = await supabase
    .from('user')
    .select('*')
    .eq('blood', bloodGroup)
    .eq('presentUpazilla', upazilla)
    .eq('presentDivision', division)
    .eq('presentDistrict', district);

    List<Map<String, String>> donorInfo = [];

    if (query.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("No Donors Found"),
            content: Text("কোন রক্তদাতা পাওয়া যায়নি। দয়া করে আবার চেষ্টা করুন।"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(
                    context,
                    '/home',
                    arguments: {
                      'loggedInUserInfo': widget.loggedInUserInfo,
                    },
                  );
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      // Show an error message or handle the case where no matching donors are found
    } else {
      // Iterate over donor data and save information for each donor in donorInfo list
      query.forEach((doc) {
        String name = doc['name'];
        String bloodGroup = doc['blood'];
        String phone = doc['mobile'];
        String village = doc['presentVillage'];
        String union = doc['presentUnion'];
        String upazilla = doc['presentUpazilla'];
        String gender = doc['gender'];
        String lastDonationDate = doc['lastDonationDate'];
        String lastDonationMonth = doc['lastDonationMonth'];
        String lastDonationYear = doc['lastDonationYear'];
        String birthDate = doc['birthDate'];
        String birthMonth = doc['birthMonth'];
        String birthYear = doc['birthYear'];
        String offDate = doc['offDate'] ?? '1';
        String offMonth = doc['offMonth'] ?? '1';
        String offYear = doc['offYear'] ?? '2000';

        String offTime = doc['offTime'] ?? '0';
        int day = int.parse(birthDate);
        String monthNameOrNumber = birthMonth;
        int year = int.parse(birthYear);
        if(lastDonationYear == ""){
          lastDonationYear = "2000";
        }
        if(lastDonationMonth == ""){
          lastDonationMonth = "1";
        }
        if(lastDonationDate == ""){
          lastDonationDate = "1";
        }
        if(offYear == ""){
          offYear = "2000";
        }
        if(offMonth == ""){
          offMonth = "1";
        }
        if(offDate == ""){
          offDate = "1";
        }
        if(offTime == ""){
          offTime = "0";
        }
        // Get the numerical representation of the month from the map
        int month = monthMap[monthNameOrNumber] ?? 1; // Default to 1 if the month name or number is not found

        // Create a DateTime object from the last donation date
        DateTime lastDonationDateTime = DateTime(year, month, day);

        // Get the current date
        DateTime currentDate = DateTime.now();
        // print('Current Date: $currentDate');
        // Calculate the difference in months
        int age = ((currentDate.year - lastDonationDateTime.year)) +
            ((currentDate.month - lastDonationDateTime.month) >= 12? 1: 0);
        // print(name + age.toString());
        // String address = '${doc['presentVillage']}, ${doc['presentUnion']}, ${doc['presentUpazilla']}';

        // Format donor information and add it to donorInfo list
        String donorInfoString = "Name: $name\nBlood Group: $bloodGroup\nPhone: $phone\nVillage: $village\nUnion: $union\nUpazilla: $upazilla";
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
          'offDate': offDate,
          'offMonth': offMonth,
          'offYear': offYear,
          'offTime': offTime,
          'age': age.toString(),
        });
      });
      print(donorInfo);

      // Navigate to CardList screen with donor data
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CardList(donorInfo: donorInfo, userVillage: gram, logedinUserInfo: widget.loggedInUserInfo ,)),
        );// Dismiss the dialog after 3 seconds
      });

       // Close the loading indicator dialog
    }
  }



  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: RefreshIndicator(
        onRefresh: () async {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            '/home',
            arguments: {
              'loggedInUserInfo': widget.loggedInUserInfo,
            },
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
                    padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20),
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
                              "রক্তদাতা খুজুন",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          DropdownAndLabel(label: "রক্তের গ্রুপ ", isRequired: true, items: bloodGroups, onChanged: updateBlood),
                          DropdownAndLabel(onChanged: updateDivision, label: "বিভাগ", isRequired: true, items: allDivision),
                          DropdownAndLabel(label: "জেলা", isRequired: true, items: allDistrict, onChanged: updateDistrict),
                          DropdownAndLabel(label: "উপজেলা", isRequired: true, items: allUpazilla, onChanged: updateUpazilla),
                          // DropdownAndLabel(label: "ইউনিয়ন", isRequired: true, items: allUnion, onChanged: updateUnion),
                          // DropdownAndLabel(label: "গ্রাম", isRequired: true, items: allGram, onChanged: updateGram),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                print("why is not working");
                                handleButton(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8.0), // Adjust the space between the icon and text
                                  Text(
                                    "খুজুন",
                                    style: TextStyle(
                                      fontSize: 16.0, // Adjust the font size as needed
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../profile/profileBody.dart';
import '../CustomBottomNav.dart';
import '../CustormDrawer.dart';
import '../Home.dart';
import '../important_numbers/important.dart';
import 'readyDonorBody.dart';
import '../profile/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReadyDonor extends StatefulWidget {
  final String? phoneNumber;
  final Map<String, String>? logedinUserInfo;

  const ReadyDonor({Key? key, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  _ReadyDonorState createState() => _ReadyDonorState();
}

class _ReadyDonorState extends State<ReadyDonor> {
  final supabase = Supabase.instance.client;
  var _currentIndex = 0;
  List<Map<String, String>> allReadyDonor = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Define _scaffoldKey

  @override
  void initState() {
    super.initState();
    print("Hello wrong");
    fetchDonorData("bloodGroup", "upazilla", "union", "gram");
  }

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

  void fetchDonorData(String bloodGroup, String upazilla, String union, String gram) async {
    final query = await supabase.from('user').select().eq('readyToDonate', 'true');
    print(query);
    List<Map<String, String>> donorInfo = [];
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
      String readyDate = doc['readyDate'] ?? '0';
      String offTime = doc['offTime'] ?? '0';

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

      int day = int.parse(birthDate);
      String monthNameOrNumber = birthMonth;
      int year = int.parse(birthYear);
      List<String> dateParts = readyDate.split('-');
      // print(dateParts);

      int readyYear = int.parse(dateParts[0]);
      int readyMonth = int.parse(dateParts[1]);
      int readyDay = int.parse(dateParts[2]);
      // int readyYear = 2024;
      // int readyMonth = 3;
      // int readyDay = 18;
      DateTime readyDate2 = DateTime(readyYear, readyMonth, readyDay);


      int month = monthMap[monthNameOrNumber] ?? 1; // Default to 1 if the month name or number is not found

      DateTime lastDonationDateTime = DateTime(year, month, day);

      DateTime currentDate = DateTime.now();

      Duration difference = readyDate2.difference(currentDate);
      int readyPeriodInDays = difference.inDays;



      int lastDonationDate1 = int.parse(doc['lastDonationDate']!) ;
      int lastDonationMonth1 = monthMap[doc['lastDonationMonth']!] ?? 1 ;
      int lastDonationYear1 = int.parse(doc['lastDonationYear']!) ;

      DateTime lastDonationDateTime1 = DateTime(lastDonationYear1, lastDonationMonth1, lastDonationDate1);

      Duration difference1 = currentDate.difference(lastDonationDateTime1);
      int lastDonationPeriodInDays = difference1.inDays;

      int age = ((currentDate.year - lastDonationDateTime.year)) +
          ((currentDate.month - lastDonationDateTime.month) >= 12 ? 1 : 0);
      print("name: $name, age: $age, readyPeriodInDays: $readyPeriodInDays, lastDonationPeriodInDays: $lastDonationPeriodInDays""");

      String donorInfoString = "Name: $name\nBlood Group: $bloodGroup\nPhone: $phone\nVillage: $village\nUnion: $union\nUpazilla: $upazilla";
      if(readyPeriodInDays <= 30 && lastDonationPeriodInDays >= 92 && age >= 18 && age<45 && bloodGroup != 'Unknown'){
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
      }
    });

    setState(() {
      allReadyDonor = donorInfo;
      print(allReadyDonor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CardBody( // Assuming ReadyDonorBody is the appropriate widget to display the fetched data
        donorInfo: allReadyDonor,
        phoneNumber: widget.phoneNumber,
        logedinUserInfo: widget.logedinUserInfo,
      ),
      drawer: CustomDrawer(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            _scaffoldKey.currentState!.openDrawer();
          } else if (index == 1) {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.pushNamed(
              context,
              '/home',
              arguments: {
                'phoneNumber': widget.phoneNumber,
                'loggedInUserInfo': widget.logedinUserInfo,
              },
            );
          } else if (index == 2) {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Important(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)),
            );
          } else {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)),
            );
          }
        },
      ),
    );
  }
}

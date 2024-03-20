import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String village;
  final String union;
  final String upazilla;
  final String phoneNumber;
  final String lastDonationDate;
  final String gender;
  final String lastDonationMonth;
  final String lastDonationYear;
  final String offDate;
  final String offMonth;
  final String offYear;
  final String offTime;
  final Map<String, String> ? logedinUserInfo;

  const CustomCard({
    Key? key,
    required this.name,
    required this.bloodGroup,
    required this.village,
    required this.union,
    required this.upazilla,
    required this.phoneNumber,
    required this.lastDonationDate,
    required this.gender,
    required this.lastDonationMonth,
    required this.lastDonationYear,
    required this.offDate,
    required this.offMonth,
    required this.offYear,
    required this.offTime,
    this.logedinUserInfo
  }) : super(key: key);

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  int calculateDaysPassed() {
    // Define a map to map month names and numerical representations to their numerical values
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

    // Split the last donation date into month, day, and year strings
    int day = int.parse(lastDonationDate);
    String monthNameOrNumber = lastDonationMonth;
    int year = int.parse(lastDonationYear);

    // Get the numerical representation of the month from the map
    int month = monthMap[monthNameOrNumber] ?? 1; // Default to 1 if the month name or number is not found

    // Create a DateTime object from the last donation date
    DateTime lastDonationDateTime = DateTime(year, month, day);

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Calculate the difference in months
    Duration difference1 = currentDate.difference(lastDonationDateTime);
    int lastDonationPeriodInDays = difference1.inDays;
    return lastDonationPeriodInDays;
  }

  int calculateoffTime() {
    try {
      // Define a map to map month names and numerical representations to their numerical values
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

      // Split the last donation date into month, day, and year strings
      int day = int.parse(offDate);
      String monthNameOrNumber = offMonth;
      int year = int.parse(offYear);

      // Get the numerical representation of the month from the map
      int month = monthMap[monthNameOrNumber] ?? 1; // Default to 1 if the month name or number is not found

      // Create a DateTime object from the last donation date
      DateTime lastDonationDateTime = DateTime(year, month, day);

      // Get the current date
      DateTime currentDate = DateTime.now();

      Duration difference1 = currentDate.difference(lastDonationDateTime);
      int lastDonationPeriodInDays = difference1.inDays;

      // Calculate the difference in months
      return lastDonationPeriodInDays;

    } catch (e) {
      // Handle parsing errors gracefully
      // print('Error calculating offTime: $e');
      return 0; // or any other default value as per your requirement
    }
  }




  @override
  Widget build(BuildContext context) {
    int? timeInt;
    try {
      timeInt = int.parse(offTime);
    } catch (e) {
      // Handle parsing errors gracefully
      timeInt = 0;
      // print('Error parsing offTime: $e');
    }
    int DaysPassed = calculateDaysPassed();
    int offTimeee = calculateoffTime();
    // print(name + offTimeee.toString());
    return IntrinsicHeight(
      child: Card(
        elevation: 10,
        shadowColor: Colors.red,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: DaysPassed > 90 && offTimeee >= (timeInt * 30)? Colors.green: Colors.red,
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  DaysPassed > 90 && offTimeee >= (timeInt * 30)? "রক্তদানের সময় হয়েছে" : "রক্তদানের সময় হয়নি",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 123,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white70,
                        ),
                        child: Center(
                          child: Text(
                            bloodGroup,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white70,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("গ্রামঃ $village"),
                            Text("ইউনিয়নঃ $union"),
                            Text("থানাঃ $upazilla"),
                            Text(
                              gender == "মহিলা" && (logedinUserInfo!['admin']!) != 'true' ? "মোবাইল নাম্বরঃ 01xxxxxxxxxx" : "মোবাইল নাম্বরঃ $phoneNumber",
                            ),
                            Text("শেষ রক্তদানঃ $lastDonationMonth $lastDonationDate, $lastDonationYear"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () async {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: '$phoneNumber', // Include the tel: prefix for phone numbers
                    );
                    if (await canLaunch(url.toString())) {
                      await launch(url.toString());
                    } else {
                      MySnackBar("কল করা যাচ্ছে না", context);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call),
                      SizedBox(width: 10),
                      Text("কল দিন"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

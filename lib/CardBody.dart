import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/DropdownAndLeble.dart';
import 'package:nawabganj_roktoseba/cardList.dart';
import 'dropdwon_button.dart';
import 'package:nawabganj_roktoseba/calender.dart';
import 'package:nawabganj_roktoseba/customCard.dart';

class CardBody extends StatelessWidget {
  final List<Map<String, String>> donorInfo;
  final String? phoneNumber;
  final String? userVillage;
  final Map<String, String> ? logedinUserInfo;

  const CardBody({Key? key, required this.donorInfo, this.userVillage, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.red[800],
      foregroundColor: Colors.white,
      fixedSize: Size(200, 50),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
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
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Column(
                    children: donorInfo.where((info) {
                      // Convert the age string to an integer for comparison
                      int? age = int.tryParse(info['age'] ?? '');

                      // Check if the age is greater than or equal to 18 and the village matches
                      return age != null && age >= 18 && info['village'] == userVillage;
                    }).map((info) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomCard(
                          name: info['name']!,
                          bloodGroup: info['bloodGroup']!,
                          village: info['village']!,
                          union: info['union']!,
                          upazilla: info['upazilla']!,
                          phoneNumber: info['phone']!,
                          lastDonationDate: info['lastDonationDate']!,
                          lastDonationMonth: info['lastDonationMonth']!,
                          lastDonationYear: info['lastDonationYear']!,
                          gender: info['gender']!,
                          offDate: info['offDate']!,
                          offMonth: info['offMonth']!,
                          offYear: info['offYear']!,
                          offTime: info['offTime']!,
                          logedinUserInfo: logedinUserInfo,
                        ),
                      );
                    }).toList(),

                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Center(
                //     child: Container(
                //       height: 40, // Adjust the height as needed
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //       ),
                //       child: Align(
                //         alignment: Alignment.center,
                //         child: Text(
                //           'অনুসন্ধানকৃত এলাকার আশেপাশের রক্তদাতাদের তালিকা ',
                //           style: TextStyle(
                //             color: Colors.white,
                //           ),
                //           textAlign: TextAlign.center, // Align text to center
                //         ),
                //       ),
                //     ),
                //   ),
                //
                //
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Column(
                    children: donorInfo.where((info) {
                      // Convert the age string to an integer for comparison
                      int? age = int.tryParse(info['age'] ?? '');

                      // Check if the age is greater than or equal to 18 and the village matches
                      return age != null && age >= 18 && age < 45 && info['village'] != userVillage && info['union'] == logedinUserInfo!['union']!;
                    }).map((info) {
                      // print(info);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomCard(
                          name: info['name']!,
                          bloodGroup: info['bloodGroup']!,
                          village: info['village']!,
                          union: info['union']!,
                          upazilla: info['upazilla']!,
                          phoneNumber: info['phone']!,
                          lastDonationDate: info['lastDonationDate']!,
                          lastDonationMonth: info['lastDonationMonth']!,
                          lastDonationYear: info['lastDonationYear']!,
                          gender: info['gender']!,
                          offDate: info['offDate']!,
                          offMonth: info['offMonth']!,
                          offYear: info['offYear']!,
                          offTime: info['offTime']!,
                          logedinUserInfo: logedinUserInfo,
                        ),
                      );
                    }).toList(),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Column(
                    children: donorInfo.where((info) {
                      // Convert the age string to an integer for comparison
                      int? age = int.tryParse(info['age'] ?? '');

                      // Check if the age is greater than or equal to 18 and the village matches
                      return age != null && age >= 18 && age < 45 && info['village'] != userVillage && info['union'] != logedinUserInfo!['union']!;
                    }).map((info) {
                      // print(info);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomCard(
                          name: info['name']!,
                          bloodGroup: info['bloodGroup']!,
                          village: info['village']!,
                          union: info['union']!,
                          upazilla: info['upazilla']!,
                          phoneNumber: info['phone']!,
                          lastDonationDate: info['lastDonationDate']!,
                          lastDonationMonth: info['lastDonationMonth']!,
                          lastDonationYear: info['lastDonationYear']!,
                          gender: info['gender']!,
                          offDate: info['offDate']!,
                          offMonth: info['offMonth']!,
                          offYear: info['offYear']!,
                          offTime: info['offTime']!,
                          logedinUserInfo: logedinUserInfo,
                        ),
                      );
                    }).toList(),

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

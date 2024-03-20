import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nawabganj_roktoseba/contact/contact.dart';
import 'package:nawabganj_roktoseba/contact/contact.dart'; // Add this import statement
import 'contactCard.dart';


class ContactBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String> ? logedinUserInfo;

  const ContactBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
    this.logedinUserInfo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> contactList = [
      {
        "name": "Rasel SR Sayem",
        "designation": "এডমিন",
        "address": "নবাবগঞ্জ",
        "phone": "01726898805",
        "ID_name": "Rasel SR Sayem",
        "facebook": "https://www.facebook.com/rasel.srsayem",
      },
      {
        "name": "Iftekhar Shible",
        "designation": "এডমিন",
        "address": "নবাবগঞ্জ",
        "phone": "01786769512",
        "ID_name": "Iftekhar Shible",
        "facebook": "https://www.facebook.com/iftekarshible",
      },
      {
        "name": "Tanvir Ahamed Niloy",
        "designation": "এডমিন",
        "address": "নবাবগঞ্জ",
        "phone": "01786769512",
        "ID_name": "Tanvir Ahamed Niloy",
        "facebook": "https://www.facebook.com/tanvirahamed.niloy.543",
      },
      {
        "name": "Rokonuzzaman Rokon",
        "designation": "এডমিন",
        "address": "নবাবগঞ্জ",
        "phone": "01717190270",
        "ID_name": "Rokonuzzaman Rokon",
        "facebook": "https://www.facebook.com/profile.php?id=100007805475039",
      },
      {
        "name": "Fojle Rabbi",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
        "ID_name": "Fojle Rabby ",
        "facebook": "https://www.facebook.com/frabby.bics",
      },
      {
        "name": "Shafayet Faysal",
        "designation": "এডমিন",
        "address": "নবাবগঞ্জ",
        "phone": "01792945846",
        "ID_name": "Faysal",
        "facebook": "https://www.facebook.com/faysal.joy.98478",
      },


    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
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
              padding: const EdgeInsets.only(left:5, top: 0, right: 5, bottom: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 0.0,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                    ),
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0.0),
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: contactList.length,
                            itemBuilder: (context, index) {
                              final contact = contactList[index];
                              return ContactCard(
                                ContactName: contact['name'] ?? '',
                                phoneNumber: contact['phone'] ?? '',
                                desination: contact['designation'] ?? '',
                                address: contact['address'] ?? '',
                                facebook: contact['facebook'] ?? '',
                                ID_name: contact['ID_name'] ?? '',

                              );
                            },
                          ),
                        ),

                      ],
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

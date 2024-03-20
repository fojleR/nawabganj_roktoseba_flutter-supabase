import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import statement
import 'policeCard.dart';

class PoliceBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String> ? logedinUserInfo;

  const PoliceBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
    this.logedinUserInfo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        FutureBuilder(
                          future: DefaultAssetBundle.of(context).loadString('lib/assets/police.json'), // Assuming Police.json is in the assets folder
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            // Check if data is successfully loaded
                            if (snapshot.hasData) {
                              // Parse JSON data
                              List<dynamic> data = json.decode(snapshot.data.toString());

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // Access data for each Police
                                  var Police = data[index];
                                  return PoliceCard(
                                    PoliceName: Police['name'],
                                    phoneNumber: Police['number'],
                                  );
                                },
                              );
                            } else {
                              // If data is not yet loaded, show a loading indicator
                              return Center(child: CircularProgressIndicator());
                            }
                          },
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

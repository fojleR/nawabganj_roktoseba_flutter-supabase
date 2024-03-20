import 'package:flutter/material.dart';
import '../../Home.dart';
import '../../Hospital/hospital.dart';
import '../../pollibiddut/pollibiddut.dart';
import '../Ambulance/ambulance.dart';
import '../Doctor/doctor.dart';
import '../FireService/fire.dart';
import '../ImportantService/importantService.dart';
import '../Journalis/journalist.dart';
import '../Police/police.dart';


class ImportantBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String> ? logedinUserInfo;

  const ImportantBody({
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          bottom: 16.0,
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
                            GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                buildCard(context,Icons.local_hospital, 'হাসপাতাল', 'Software Engineer'),
                                buildCard(context,Icons.medical_information , 'ডাক্তার', 'Software Engineer'),
                                buildCard(context,Icons.directions_car, 'এম্বুলেন্স', 'Software Engineer'),
                                buildCard(context,Icons.local_fire_department, 'ফায়ার সার্ভিস', 'Software Engineer'),
                                buildCard(context,Icons.electrical_services, 'পল্লী বিদ্যুৎ সার্ভিস', 'Software Engineer'),
                                buildCard(context,Icons.article, 'সাংবাদিক', 'Software Engineer'),
                                buildCard(context,Icons.local_police, 'পুলিশ স্টেশন', 'Software Engineer'),
                                buildCard(context,Icons.warning, 'জরুরী সেবাসমূহ', 'Software Engineer'),
                              ],
                            )
                          ],
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
    );
  }

  Widget buildCard(BuildContext context, IconData icon, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective page based on the card tapped
        if (title == 'হাসপাতাল') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Hospital(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
          );
        }
        else if(title == 'পল্লী বিদ্যুৎ সার্ভিস'){
          // Handle other card taps
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Pollibiddut(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
          );
        }
        else if(title == 'এম্বুলেন্স'){
            // Handle other card taps
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ambulance(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
            );
          }
        else if(title == 'ডাক্তার'){
            // Handle other card taps
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Doctor(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
            );
          }
         else if(title == 'ফায়ার সার্ভিস'){
            // Handle other card taps
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Fire(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
            );
          }
         else if(title == 'সাংবাদিক'){
            // Handle other card taps
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Journalist(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
            );
          }
         else if(title == 'পুলিশ স্টেশন'){
            // Handle other card taps
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Police(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
            );
          }
         else if(title == 'জরুরী সেবাসমূহ'){
            // Handle other card taps
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImportantService(phoneNumber: phoneNumber, logedinUserInfo: logedinUserInfo)),
            );
          }

        },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.red,
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              // Text(
              //   subtitle,
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.grey,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }


}

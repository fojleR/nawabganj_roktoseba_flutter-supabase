import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  final String ContactName;
  final String phoneNumber;
  final String desination;
  final String address;
  final String facebook;
  final String ID_name;
  final Map<String, String> ? logedinUserInfo;

  const ContactCard({
    Key? key,
    required this.ContactName,
    required this.phoneNumber,
    required this.desination,
    required this.address,
    required this.facebook,
    required this.ID_name,
    this.logedinUserInfo
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    void _launchFacebookUrl() async {
      if (await canLaunch('$facebook')) {
        await launch('$facebook');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Could not launch Facebook.")),
        );
      }
    }
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 16.0), // Add bottom margin here
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.red),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          ContactName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.admin_panel_settings , color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        desination,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_pin, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        address,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: Colors.blue),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          _launchFacebookUrl(); // Function to launch Facebook URL
                        },
                        child: Text(
                          ID_name, // Displayed text
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            // Add underline style
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.phone),
                      color: Colors.white,
                      onPressed: () async {
                        final Uri url = Uri(
                          scheme: 'tel',
                          path: '$phoneNumber',
                        );
                        if (await canLaunch(url.toString())) {
                          await launch(url.toString());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("কল করা যাচ্ছে না")),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}


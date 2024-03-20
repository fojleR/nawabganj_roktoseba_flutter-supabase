import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String>? logedinUserInfo;

  const AboutBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
    this.logedinUserInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchFacebookUrl(String url) async {
      if (await canLaunch('$url')) {
        await launch('$url');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Could not launch Facebook.")),
        );
      }
    }
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
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'নবাবগঞ্জ রক্তসেবা',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'প্রিয়জনের রক্তের জন্য দিক বেদিক ছুটে বেড়ানো মানুষের কষ্ট ও দু:চিন্তা লাঘব করার জন্য কিছু'
                          ' তরুন যুবকদের প্রচেষ্টার ফল স্বরূপ ২০২০ সালের ২৫ ডিসেম্বর থেকে যাত্রা'
                          ' শুরু হয় নবাবগঞ্জ রক্তসেবার। সূচনালগ্ন হতেই নবাবগঞ্জ রক্তসেবা হাজার হাজার '
                          'মানুষের রক্তের প্রয়োজন মিটিয়ে আসছে। শুধু নবাবগঞ্জ না, দেশের যেকোন প্রান্ত থেকে'
                          ' যখনি রক্তসেবার কাছে রক্তদাতার রিকুয়েষ্ট আসে নবাবগঞ্জ রক্তসেবার নিবেদিত প্রাণ কর্মীরা'
                          ' তাদের সর্বোচ্চ প্রচেষ্টার মাধ্যমে রক্তদাতা সরবারহ করে আসছে।',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'নবাবগঞ্জ রক্তসেবা একটি সম্পূর্ণ অরাজনৈতিক , অলাভজনক সেচ্ছাসেবী সংগঠন। নবাবগঞ্জ রক্তসেবা সকল ধর্ম, বর্ণের সচ্ছল, অসচ্ছল সকল পেশার সকল মানুষকে বৈষম্যবিহীন সেবা প্রদান করে।'
                          ' শুধু রক্তদানের মধ্যেই সীমাবদ্ধ না থেকে নবাবগঞ্জ রক্তসেবা বিভিন্ন রকমের সেচ্ছাসেবী কার্যক্রমে অংশগ্রহণ করে থাকে।',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5, top: 0, right: 5, bottom: 20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'আমাদের উদ্দেশ্যঃ',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'নবাবগঞ্জের অসহায় মানুষের বিভিন্ন প্রয়োজনে সহযোগীতার মাধ্যমে একটি'
                          ' সমৃদ্ধ উপজেলা হিসেবে গড়ে তুলতে সর্বাত্মক সহযোগিতা করা।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5, top: 0, right: 5, bottom: 20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'আমাদের কার্যক্রমসমূহঃ',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-নবাবগঞ্জ সহ আশেপাশের এলাকার মানুষকে রক্তের প্রয়োজনে সহযোগীতা করা।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-বিভিন্ন সেচ্ছাসেবী কার্যক্রম যেমন ফ্রী চক্ষু ক্যাম্প, বিভিন্ন সরকারি ও বেসরকারি সেচ্ছাসেবী কার্যক্রমে সক্রিয়ভাবে অংশগ্রহণ করা।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-বিভিন্ন দুর্যোগকালীন সময়ে ত্রান সামগ্রীর ব্যাবস্থা করা।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-অসহায় শীতার্ত মানুষের মাঝে শীতবস্ত্র বিতরণ  করা।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-অসহায় মানুষের মাঝে ঈদ সামগ্রী বিতরণ।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-বিভিন্ন কার্যক্রমের মাধ্যমে নবাবগঞ্জের শিক্ষার্থীদের পড়ালেখার প্রতি আগ্রহী করা।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-মেধাবী অসচ্ছল শিক্ষার্থীদের সহযোগিতা করা।',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '-কৃতি শিক্ষার্থীদের সংবর্ধনা',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),

                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5, top: 0, right: 5, bottom: 20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.facebook, color: Colors.blue),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _launchFacebookUrl("https://www.facebook.com/nawabganjroktoseba"); // Function to launch Facebook URL
                          },
                          child: Text(
                            "নবাবগঞ্জ রক্তসেবা", // Displayed text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline, // Add underline style
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.group, color: Colors.blue),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _launchFacebookUrl("https://www.facebook.com/groups/nawabganjblood"); // Function to launch Facebook URL
                          },
                          child: Text(
                            "নবাবগঞ্জ রক্তসেবা", // Displayed text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline, // Add underline style
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.thumb_up, color: Colors.blue),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _launchFacebookUrl("https://www.facebook.com/Nawabganjrokto"); // Function to launch Facebook URL
                          },
                          child: Text(
                            "নবাবগঞ্জ রক্তসেবা", // Displayed text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline, // Add underline style
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("01300266482")
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.mail, color: Colors.red),
                        SizedBox(width: 8),
                        Text("nawabganjroktoseba@gmail.com")
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

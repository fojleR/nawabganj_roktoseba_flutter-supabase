import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nawabganj_roktoseba/bloodDonate/bloodDonate.dart';
import 'package:nawabganj_roktoseba/bloodDonate/bloodDonate.dart'; // Add this import statement

class BloodDonateBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String> ? logedinUserInfo;

  const BloodDonateBody({
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
                  Text(
                    'রক্তদান সম্পর্কে তথ্যসমূহ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
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
                      SizedBox(height: 5.0),
                      Text(
                        '১.কেন রক্তদান করবেন?',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'রক্ত দেওয়া একটি মানবিক প্রয়োজনীয় কর্ম, যা সমাজের স্বাস্থ্য ব্যবস্থা সমর্থন করে।'
                            ' রক্তদানের মাধ্যমে অনেক মানুষের জীবন বাঁচানো সম্ভব হয়।'
                            ' রক্ত প্রয়োজন হয় নিম্নলিখিত কারণে:',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'দুর্ঘটনা ও অসুস্থতার কারণেঃ ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              text:
                              'সাধারনত রক্ত প্রয়োজন হয় অসুস্থ ব্যক্তিদের সাহায্যের জন্য, '
                                  'যেমন অ্যাক্সিডেন্ট, অপারেশন, ধ্বংসপ্রাপ্ত অবস্থা ইত্যাদি।',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'সার্জারি অপারেশনঃ ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                              ' অনেক সার্জারি অপারেশনে রক্তের প্রয়োজন হয় যেমন হৃৎপিণ্ডের অপারেশন,'
                                  ' যৌথ রক্তচাপ অপারেশন, যেসব অপারেশনে বেশি রক্তক্ষরণ'
                                  ' হয়।',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'গর্ভাবস্থা ও জন্মের সময়ঃ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                              ' গর্ভাবস্থা ও জন্মের সময় মা ও শিশুর জীবন বাঁচানোর জন্য রক্ত প্রয়োজন হয়।',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'সাম্প্রতিক রোগ বা জীবাণুজনিত সমস্যাঃ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                              'কিছু রোগে যেমন ক্যান্সার, আইডিএস, ডেঙ্গু ইত্যাদির চিকিৎসার জন্য রক্ত প্রয়োজন হতে পারে।',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                  Container(
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
                        SizedBox(height: 5.0),
                        Text(
                          '২.কারা রক্তদান করতে পারবে? ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'বয়সঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                '১৮ থেকে ৪৫ বছর বয়সের মধ্যে সুস্থ ব্যক্তিদের রক্ত দেওয়া যাবে।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'ওজনঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'পুরুষদের জন্য অন্তত ৪৮ কেজি এবং নারীদের জন্য অন্তত ৪৫ কেজি ওজন থাকতে হবে।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'স্বাস্থ্য অবস্থাঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্তদাতার স্বাস্থ্য ভালো হতে হবে এবং ভাইরাসিক জনিত রোগ, শ্বাসযন্ত্রের রোগ,'
                                    ' এবং ত্বকের অসুস্থতা থেকে মুক্ত থাকতে হবে।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'তাপমাত্রা ও নাড়ির গতিঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্তদাতার তাপমাত্রা ৯৯.৫ ফারেনহাইটের নিচে এবং নাড়ির গতি ৭০ থেকে ৯০ এর মধ্যে থাকতে হবে।',
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'তাপমাত্রা ও নাড়ির গতিঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'করক্তদাতার তাপমাত্রা ৯৯.৫ ফারেনহাইটের নিচে এবং নাড়ির গতি ৭০ থেকে ৯০ এর মধ্যে থাকতে হবে।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'রক্তচাপঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্তদাতার রক্তচাপের মান স্বাভাবিক হতে হবে।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'হিমোগ্লোবিন পরিমাণঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'পুরুষদের ক্ষেত্রে হিমোগ্লোবিন প্রতি ডেসিলিটারে ১৫ গ্রাম এবং নারীদের ক্ষেত্রে ১৪ গ্রাম হতে হবে।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'সময়সীমাঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'সাধারণত ৯০ দিন পর পর, অর্থাৎ প্রতি তিন মাসে রক্ত দিতে যাওয়া যাবে।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'রক্তের পরিমাণঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'সাধারণত প্রাপ্তবয়স্ক সুস্থ মানুষের শরীরে ৪ থেকে ৬ লিটার পরিমাণ রক্ত থাকে। প্রতিবার ৪৫০ মিলিলিটার রক্ত দেয়া হয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Container(
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
                        SizedBox(height: 5.0),
                        Text(
                          '৩.কারা রক্তদান করতে পারবে না? ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color:Colors.red,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'হিমোগ্লোবিনের মাত্রা কমঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'যদি রক্তদাতার হিমোগ্লোবিনের মাত্রা'
                                    ' ১২.৫ থেকে কম হয়, তবে রক্ত দেওয়া উচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'শরীরের অস্থিরতাঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'যদি রক্তদাতার রক্তচাপ বা তাপমাত্রা স্বাভাবিক না থাকে, তবে রক্ত দেওয়া সমুচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'শ্বাস-প্রশ্বাসজনিত রোগঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'হাঁপানি বা অ্যাজমা হলে রক্ত দেওয়া উচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'রক্তবাহিত রোগঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'এই রোগগুলির মধ্যে হেপাটাইটিস বি বা সি, এইডস, জন্ডিস, সিফিলিস, গনোরিয়া,'
                                    ' ম্যালেরিয়া ইত্যাদি রয়েছে। এই রোগগুলি থাকলে রক্ত দেওয়া উচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'নারীদের অন্তঃসত্ত্বা বা ঋতুস্রাবঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'নারীদের যাদের অন্তঃসত্ত্বা চলছে অথবা ঋতুস্রাব চলছে, তাদের রক্ত দেওয়া উচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'ওষুধ সেবনঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'কিছু ওষুধের সেবন করলে রক্ত দেওয়া উচিত নয়, যেমন কেমোথেরাপি, হরমোন থেরাপি, অ্যান্টিবায়োটিক ইত্যাদি।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'দুর্ঘটনা বা অস্ত্রোপচারঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'যদি কোনো বড় দুর্ঘটনা বা অস্ত্রোপচার সম্প্রতি হয়ে থাকে, তবে রক্ত দেওয়া উচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Container(
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
                          '৪.রক্তদানের পর করণীয়',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'বিশ্রাম নিনঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্তদানের পরে প্রাথমিক বিশ্রাম নিতে হবে।'
                                    ' রক্ত দেওয়ার পর বিশেষ করে গাড়ি চালাবেন না বা ভারী কাজ করবেন না।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'পানি খাবারঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্ত দেওয়ার পর প্রচুর পরিমাণে পানি খাবেন। রক্ত দেওয়ার পর দেহের শরীরের '
                                    'পরিমাণিত পানির প্রয়োজন হয় যাতে রক্তদানের পর খুব শীঘ্রই শরীরের সামগ্রিক স্থিতি পূর্ণ হয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'প্রোটিন ও শর্করাজাতীয় খাবারঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'পরিমাণিত প্রোটিন এবং শর্করা গ্রহণ করা যাবে, যেমন, জুস বা শরবত। এছাড়াও,'
                                    ' রক্ত দেওয়ার পর আপনাকে ডোনারদের গ্লুকোজ দেওয়া হয়, এটা খুবই উপযোগী।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'ধূমপান ও মদ্যপান না করাঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্ত দেওয়ার পর ধূমপান ও মদ্যপান করা উচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'ব্যায়াম ও শারীরিক কসরত না করাঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্ত দেওয়ার পর ব্যায়াম বা শারীরিক কসরত করা উচিত নয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'কিছুক্ষণ শুয়ে থাকুনঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্ত দেওয়ার পর কিছুক্ষণ শুয়ে থাকুন। উঠার আগে প্রথমে প্রতিষ্ঠানের'
                                    ' প্রশিক্ষিত কর্মীদের সাথে যোগাযোগ করুন।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'অপেক্ষা করুনঃ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'রক্ত দেওয়ার পর পরে ছয় থেকে বারো সপ্তাহ অপেক্ষা করুন। এরপর আপনি আবার'
                                    ' রক্ত দিতে পারবেন। এই সময়ে লোহিত কণিকার সঠিক পরিমাণ পুনরুত্থান হয়।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Container(
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
                        SizedBox(height: 5.0),
                        Text(
                          '৪.নারীদের জন্য নির্দেশনা',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 5.0),

                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: '- ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'গর্ভকালীন ও প্রসব–পরবর্তী বা গর্ভপাতের পর ছয় মাস পর্যন্ত রক্ত দান করা যাবে না।',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: '- ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                'মায়েরা দুগ্ধদানের সময় রক্তদানে সাময়িক বিরত থাকবেন।',
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
          ],
        ),
      ),
    );
  }
}

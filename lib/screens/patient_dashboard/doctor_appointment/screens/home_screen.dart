import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/screens/patient_dashboard/doctor_appointment/components/category_card.dart';
import 'package:mental_health/screens/patient_dashboard/doctor_appointment/components/doctor_card.dart';
import 'package:mental_health/screens/patient_dashboard/doctor_appointment/components/search_bar.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant.dart';
import 'doctor_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Professional Remedies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        elevation: 1,
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Find Your Desired\nRemedy',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildCategoryList(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Top Psychologists',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildDoctorList(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 30,
          ),
          CategoryCard('Psychologist', 'assets/icons/psychiatrist.png',
              kOrangeColor,'Psychologist', child: null,),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
      width: 130,
      height: 160,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse('https://mentalhealthuganda.org')),
        child: Stack(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 110,
                height: 137,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Articles',
                    style: TextStyle(
                      color: kTitleTextColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  color: kYellowColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/icons/dental_surgeon.png',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
          // CategoryCard('Articles', 'assets/icons/dental_surgeon.png',
          //     kBlueColor, InkWell(
          //       onTap:() => launchUrl(Uri.parse('https://www.aota.org')),
          //       child: Text(
          //         'Articles',
          //         // style: TextStyle(decoration: TextDecoration.underline,
          //         // color: Colors.blue),
          //       ),
          //     )
          // ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
      width: 130,
      height: 160,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse('https://m.youtube.com/mentalhealth')),
        child: Stack(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 110,
                height: 137,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Videos',
                    style: TextStyle(
                      color: kTitleTextColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/icons/heart_surgeon.png',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
          // CategoryCard('Videos', 'assets/icons/heart_surgeon.png',
          //     kYellowColor, InkWell(
          //       onTap:() => launchUrl(Uri.parse('https://m.youtube.com/mentalhealth')),
          //       child: Text(
          //         'Videos',
          //         // style: TextStyle(decoration: TextDecoration.underline,
          //         // color: Colors.blue),
          //       ),
          //     )
          // ),
          const SizedBox(
            width: 10,
          ),
          // CategoryCard('Music', 'assets/icons/eye_specialist.png',
          //     kOrangeColor, InkWell(
          //       onTap:() => launchUrl(Uri.parse('https://open.spotify.com')),
          //       child: Text(
          //         'Music',
          //         // style: TextStyle(decoration: TextDecoration.underline,
          //         // color: Colors.blue),
          //       ),
          //     )
          // ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
      width: 130,
      height: 160,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse('https://open.spotify.com')),
        child: Stack(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 110,
                height: 137,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Music',
                    style: TextStyle(
                      color: kTitleTextColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/icons/eye_specialist.png',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    const SizedBox(
            width: 30,
    ),
        ],
      ),
    );
  }

  List<DoctorModel> doctors = [DoctorModel("", "", "", "", "", "")];
  buildDoctorList() {
    doctors.removeAt(0);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('userdata').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            for (var element in snapshot.data!.docs) {
              try {
                if (element['type'] == "doctor") {
                  doctors.add(DoctorModel(
                      element.id,
                      element['name'],
                      element['specialization'],
                      element['phone'],
                      element['hospital'],
                      element['about']));
                }
              } catch (e) {
                continue;
              }
            }
          }
          return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: (doctors.length <= 3) ? doctors.length : 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: (snapshot.data != null)
                            ? ([
                                DoctorCard(
                                  doctors[index].uid,
                                  doctors[index].displayName,
                                  doctors[index].specialization! +
                                      "-" +
                                      doctors[index].hospital!,
                                  (index % 2 == 0) ? kBlueColor : kYellowColor,
                                  doctors[index].bio,
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ])
                            : ([const CircularProgressIndicator()]),
                      );
                    },
                  ),
                  const SizedBox(height: 80),
                ],
              ));
        });
  }

  getDoctors() async {
    setState(() {});
    FirebaseFirestore.instance
        .collection('userdata')
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        try {
          if (element['type'] == "doctor") {
            doctors.add(DoctorModel(
                element.id,
                element['name'],
                element['specialization'],
                element['phone'],
                element['hospital'],
                element['about']));
          }
        } catch (e) {
          continue;
        }
      }
    });
  }
}

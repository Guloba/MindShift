import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/screens/patient_dashboard/doctor_appointment/components/category_card.dart';
import 'package:mental_health/screens/patient_dashboard/doctor_appointment/components/doctor_card.dart';
import 'package:mental_health/screens/patient_dashboard/doctor_appointment/components/search_bar.dart';
import 'package:url_launcher/link.dart';
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
          CategoryCard('Articles', 'assets/icons/dental_surgeon.png',
              kBlueColor, 'Articles',
              child: Link(
                target: LinkTarget.self,
                uri: Uri.parse('https://www.aota.org'),
                builder: (context, followLink) => GestureDetector(
                  onTap: followLink,
                child: Text(
                  'Articles',),
                ),
              ),
          ),
          const SizedBox(
            width: 10,
          ),
          CategoryCard('Videos', 'assets/icons/heart_surgeon.png',
              kYellowColor, 'Videos',
              child: Link(
                target: LinkTarget.self,
                uri: Uri.parse('https://m.youtube.com/mentalhealth'),
                builder: (context, followLink) => GestureDetector(
                  onTap: followLink,
                child: Text(
                  'Videos',),
                ),
              ),),
          const SizedBox(
            width: 10,
          ),
          CategoryCard('Music', 'assets/icons/eye_specialist.png',
              kOrangeColor, 'Music',
              child: Link(
                target: LinkTarget.self,
                uri: Uri.parse('https://open.spotify.com'),
                builder: (context, followLink) => GestureDetector(
                  onTap: followLink,
                child: Text(
                  'Music',),
                ),
              ),),
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

import 'package:flutter/material.dart';
import 'package:mental_health/screens/k_ten_scale/screens/welcome/welcome_screen.dart';
import 'package:mental_health/screens/patient_dashboard/ui_view/mediterranean_diet_view.dart';
import 'package:mental_health/screens/patient_dashboard/ui_view/running_view.dart';
import 'package:mental_health/screens/patient_dashboard/ui_view/workout_view.dart';

class Diet extends StatefulWidget {
  const Diet({Key? key}) : super(key: key);

  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Status",
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: const WorkoutView(),
    );
  }
}

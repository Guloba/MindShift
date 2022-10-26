import 'package:flutter/material.dart';
import 'package:mental_health/screens/patient_dashboard/training/components/video_screen.dart';
import 'package:mental_health/screens/patient_dashboard/training/data/data.dart';
import 'package:mental_health/screens/patient_dashboard/training/models/course.dart';
import 'package:mental_health/utils/constants.dart';

var videoList = [
  {
    'name':'Bodyweight Squats',
    'media_url':'https://media.hearstapps.com/loop/video/wide-leg-sumo-squats-1548194343.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_Strength-training_Bodyweight-Squat_Christine_Final/NYT_Strength-training_Bodyweight-Squat_Christine_Final-blog480-v2.jpg' 
  },

  {
    'name':'Push-ups',
    'media_url':'https://media.hearstapps.com/loop/video/standard-pushup-1561991061.mp4',
    'thumb_url':'https://static01.nyt.com/images/2019/02/26/science/26-PUSHUP/NYT_Strength-Training_Pushup_Howard_Final-blog480-v2.jpg'
  },

  {
    'name':'Mountain Climbers',
    'media_url':'https://media.hearstapps.com/loop/video/wh-loops-day-2-taylor-122-mountainclimbers-v1-1665091949.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_StrengthTraining_Mountain-Climbers_Christine_Final/NYT_StrengthTraining_Mountain-Climbers_Christine_Final-blog480-v2.jpg'
  },
    
  {
    'name':'Planks',
    'media_url':'https://hmg-h-cdn.hearstapps.com/videos/why-fitness-plank-with-knee-tap-bree-1613500417.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_Strength-Training_Forearm-Plank_Howard_Final/NYT_Strength-Training_Forearm-Plank_Howard_Final-blog480-v2.jpg'
  },

  {
    'name':'Bodyweight Split Squats',
    'media_url':'https://media.hearstapps.com/loop/video/single-leg-bulgarian-split-squat-1560798588.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_Strength-Training_Bodyweight-Split-Squat_Shom_Final/NYT_Strength-Training_Bodyweight-Split-Squat_Shom_Final-blog480-v2.jpg'
  },

  {
    'name':'Hip Raises',
    'media_url':'https://media.hearstapps.com/loop/video/wh-fitness-hip-thrust-1595427037.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_StrengthTraining_Single-Leg-Hip-Raise_Howard_Final_/NYT_StrengthTraining_Single-Leg-Hip-Raise_Howard_Final_-blog480.jpg'
  },

  {
    'name':'Burpees',
    'media_url':'https://media.hearstapps.com/loop/video/burpee-1552496959.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_StrengthTraining_Burpee-With-Push-Up_Shom_Final/NYT_StrengthTraining_Burpee-With-Push-Up_Shom_Final-blog480-v2.jpg'
  },

  {
    'name':'Toe Touches',
    'media_url':'https://media.hearstapps.com/loop/video/wh-fitness-toe-touch-1617306758.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_StrengthTraining_Single-Leg-Toe-Touches_Christine_Final/NYT_StrengthTraining_Single-Leg-Toe-Touches_Christine_Final-blog480-v2.jpg'
  },

  {
    'name':'Leg Raises',
    'media_url':'https://media.hearstapps.com/loop/video/7-11-pink-moves-14b-1536784231.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_Strength-training_Leg-Raises_Shom_Final/NYT_Strength-training_Leg-Raises_Shom_Final-blog480-v2.jpg'
  },

  {
    'name':'Reverse Lunges',
    'media_url':'https://media.hearstapps.com/loop/video/14-reverse-lunge-1534791784.mp4',
    'thumb_url':'https://static01.nyt.com/images/2017/03/13/well/move/NYT_StrengthTraining_Reverse-Lunges_Christine_Final/NYT_StrengthTraining_Reverse-Lunges_Christine_Final-blog480.jpg'
  },
];


class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Course course = courses[index];

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: Constants.appPadding / 3),
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: Constants.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: Constants.black.withOpacity(0.1),
                  blurRadius: 5.0,
                  offset: const Offset(-1, 5))
            ]
            ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.35,
                height: size.height * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: AssetImage(course.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.appPadding / 2, top: Constants.appPadding / 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(Icons.folder_open_rounded,color: Constants.black.withOpacity(0.3),),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(course.students,style: TextStyle(color: Constants.black.withOpacity(0.3),),)
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined,color: Constants.black.withOpacity(0.3),),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(course.time.toString() + ' min',style: TextStyle(color: Constants.black.withOpacity(0.3),),)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.appPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Exercises',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Constants.primary),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: SizedBox(
            height: size.height * 0.33,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: videoList
                .map((e) => GestureDetector(
                  onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoScreen(
                    name:e['name']!,
                    mediaUrl:e['media_url']!,
                  ))
                  ),
                  child: Image.network(e['thumb_url']!),
                ))
                .toList(),
  ),
          ),
          ),
      ],
    );
  }
}

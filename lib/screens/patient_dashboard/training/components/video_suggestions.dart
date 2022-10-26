import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  'https://static01.nyt.com/images/2017/03/13/well/move/NYT_Strength-training_Bodyweight-Squat_Christine_Final/NYT_Strength-training_Bodyweight-Squat_Christine_Final-blog480-v2.jpg',
  'https://static01.nyt.com/images/2019/02/26/science/26-PUSHUP/NYT_Strength-Training_Pushup_Howard_Final-blog480-v2.jpg',
  'https://static01.nyt.com/images/2017/03/13/well/move/NYT_StrengthTraining_Mountain-Climbers_Christine_Final/NYT_StrengthTraining_Mountain-Climbers_Christine_Final-blog480-v2.jpg',
  'https://static01.nyt.com/images/2017/03/13/well/move/NYT_Strength-Training_Forearm-Plank_Howard_Final/NYT_Strength-Training_Forearm-Plank_Howard_Final-blog480-v2.jpg',
];

class VideoSuggestions extends StatefulWidget {
  const VideoSuggestions({key}) : super(key: key);

  @override
  _VideoSuggestionsState createState() => _VideoSuggestionsState();
}

class _VideoSuggestionsState extends State<VideoSuggestions> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 170,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: imagesList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black45.withOpacity(0.1),
                              offset: const Offset(0, 0),
                              blurRadius: 10),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                              item,
                            ),
                            fit: BoxFit.cover),
                        color: Colors.orange,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(55),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 115,
                        ),
                        Container(
                          height: 55,
                          width: 400,
                          decoration: const BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              // const Icon(
                              //   Icons.alarm,
                              //   size: 20,
                              //   color: Colors.white,
                              // ),
                              // const Text(
                              //   "5 min",
                              //   style: TextStyle(color: Colors.white),
                              // ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imagesList.map((urlOfItem) {
            int index = imagesList.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? const Color.fromRGBO(0, 0, 0, 0.8)
                    : const Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

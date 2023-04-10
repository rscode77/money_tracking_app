import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TextCarousel extends StatefulWidget {
  const TextCarousel({
    Key? key,
  }) : super(key: key);
  @override
  State<TextCarousel> createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  int actualSlide = 0;
  List<Map<String, Object>> appDescription = [
    {'id': 0, 'text': 'Control and track what you spend your money on.'},
    {'id': 1, 'text': 'Lorem Ipsum is simply dummy text of the printing.'},
    {'id': 2, 'text': 'Lorem Ipsum is not simply random text.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(right: 80.w),
          child: Text(
            'Best Way To Tracking Your Money.',
            style: TextStyle(
              fontFamily: 'DarkGrotesque',
              fontSize: 42,
              color: Colors.white,
              height: 1.h,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Gap(15.h),
        CarouselSlider(
          items: appDescription.map(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.only(right: 80.w),
                    child: Text(
                      i['text'].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'DarkGrotesque',
                        height: 1.h,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                actualSlide = index;
              });
            },
            aspectRatio: 5,
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
          ),
        ),
        Row(
          children: [
            for (var i in appDescription)
              Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: Icon(
                  Icons.circle,
                  color: actualSlide == i['id'] as int ? Colors.white : Colors.white24,
                  size: 11,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

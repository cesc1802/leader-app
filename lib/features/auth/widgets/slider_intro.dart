import 'package:flutter/material.dart';
import 'package:leader_app/resources/app_constants.dart';
import 'package:leader_app/utils/color_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView.builder(
            itemCount: kIntroSliderItems.length,
            controller: pageController,
            itemBuilder: (context, index) {
              final sliderItem = kIntroSliderItems[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    sliderItem.imageUrl,
                    height: 205, // need fixed height
                    gaplessPlayback:
                        true, // avoid white flash when image is repainted
                  ),
                  Text(
                    sliderItem.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: kIntroSliderItems.length,
          effect: ExpandingDotsEffect(
            spacing: 8.0,
            radius: 8.0,
            dotWidth: 8.0,
            dotHeight: 8.0,
            dotColor: ColorUtils.convertFromHexColor(hexColor: "#3754AF")
                .withOpacity(0.75),
            activeDotColor: ColorUtils.convertFromHexColor(hexColor: "#3754AF"),
          ),
        ),
      ],
    );
  }
}

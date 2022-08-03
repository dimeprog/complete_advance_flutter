import 'dart:ui';

import 'package:complete_advance_flutter/presentation/Resources/assets_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/strings_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/onboarding_page.dart';
import 'widget/slider_obj.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var _currentIndex = 0;
  PageController _pagecontroller = PageController(initialPage: 0);
  final List<SliderObject> _sliderList = [
    SliderObject(
      title: AppStringManager.onboardingTitle1,
      subTitle: AppStringManager.onboardingSubTitle1,
      image: AssetManager.onboardingLogo1,
    ),
    SliderObject(
      title: AppStringManager.onboardingTitle2,
      subTitle: AppStringManager.onboardingSubTitle2,
      image: AssetManager.onboardingLogo2,
    ),
    SliderObject(
      title: AppStringManager.onboardingTitle3,
      subTitle: AppStringManager.onboardingSubTitle3,
      image: AssetManager.onboardingLogo3,
    ),
    SliderObject(
      title: AppStringManager.onboardingTitle4,
      subTitle: AppStringManager.onboardingSubTitle4,
      image: AssetManager.onboardingLogo4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorManager.white,
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) => OnBoardingPage(
          sliderObject: _sliderList[index],
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorManager.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStringManager.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            _getOnBoardingBottomNavBar()
          ],
        ),
      ),
    );
  }

  Widget _getIndicatorCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(AssetManager.solidCircleIc);
    }
    return SvgPicture.asset(AssetManager.hollowCircleIc);
  }

  Widget _getOnBoardingBottomNavBar() {
    return Container(
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Row(
          children: [
            // adding left arrow
            SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(AssetManager.leftArrow),
            ),

            for (int i = 0; i <= _sliderList.length; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: _getIndicatorCircle(i),
              ),
            // adding right arrow
            SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(AssetManager.leftArrow),
            )
          ],
        ),
      ),
    );
  }
}

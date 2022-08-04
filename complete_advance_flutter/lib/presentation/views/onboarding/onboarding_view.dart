// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:complete_advance_flutter/presentation/Resources/assets_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/strings_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/values_manager.dart';
import 'package:flutter/foundation.dart';
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
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _pagecontroller,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: 4,
          itemBuilder: (context, index) => OnBoardingPage(
            sliderObject: _sliderList[index],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: AppSize.s90,
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
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            // adding nav container to onboarding screen
            _getOnBoardingBottomNavBar()
          ],
        ),
      ),
    );
  }

//   function of arrow right
  void _getToggleForword() {
    if (_currentIndex <= 4) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  // function of arrow left
  void _getToggleBack() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

//  adding indicator
  Widget _getIndicatorCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(AssetManager.solidCircleIc);
    }
    return SvgPicture.asset(AssetManager.hollowCircleIc);
  }

//  building nav container
  Widget _getOnBoardingBottomNavBar() {
    return Container(
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // adding left arrow
              if (_currentIndex != 0)
                GestureDetector(
                  onTap: () async {
                    await _pagecontroller
                        .animateToPage(_currentIndex,
                            duration: const Duration(
                              microseconds: DurationConstant.d300,
                            ),
                            curve: Curves.bounceIn)
                        .then((value) => _getToggleBack());
                  },
                  child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(AssetManager.leftArrow,
                        fit: BoxFit.cover),
                  ),
                ),
              const SizedBox(width: AppSize.s40),
              // adding indicator loop
              for (int i = 0; i < _sliderList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getIndicatorCircle(i),
                ),
              const SizedBox(width: AppSize.s40),
              // adding right arrow
              GestureDetector(
                onTap: () async {
                  await _pagecontroller
                      .animateToPage(_currentIndex,
                          duration: const Duration(
                            microseconds: DurationConstant.d300,
                          ),
                          curve: Curves.bounceIn)
                      .then((value) => _getToggleForword());
                },
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(AssetManager.rightArrow),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

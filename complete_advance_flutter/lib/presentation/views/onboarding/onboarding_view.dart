// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:complete_advance_flutter/presentation/Resources/assets_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/strings_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/values_manager.dart';
import 'package:complete_advance_flutter/presentation/views/onboarding/onboarding_baseviewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/onboarding_page.dart';
import '../../../domain/slider_obj_model.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pagecontroller = PageController(initialPage: 0);
  final OnboardingBaseViewModel _viewModel = OnboardingBaseViewModel();
  // binding
  _binding() {
    _viewModel.onStart();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _binding();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outputSliderViewModel,
      builder: (context, AsyncSnapshot<SliderViewObject> snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return _getContentWidget(snapShot.data);
        }
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? data) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _pagecontroller,
          onPageChanged: (index) {
            _viewModel.currentIndex = index;
          },
          // onPageChanged: (index) {
          //   setState(() {
          //     _viewModel.currentIndex = index;
          //   });
          // },
          itemCount: 4,
          itemBuilder: (context, index) => OnBoardingPage(
            sliderObject: data?.SliderObject,
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
            _getOnBoardingBottomNavBar(data!)
          ],
        ),
      ),
    );
  }

//  adding indicator
  Widget _getIndicatorCircle(int index) {
    if (index == _viewModel.currentIndex) {
      return SvgPicture.asset(AssetManager.solidCircleIc);
    }
    return SvgPicture.asset(AssetManager.hollowCircleIc);
  }

//  building nav container
  Widget _getOnBoardingBottomNavBar(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // adding left arrow

              GestureDetector(
                onTap: () async {
                  await _pagecontroller
                      .animateToPage(_viewModel.currentIndex,
                          duration: const Duration(
                            microseconds: DurationConstant.d300,
                          ),
                          curve: Curves.bounceIn)
                      .then((value) => _viewModel.getToggleBack());
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
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getIndicatorCircle(i),
                ),
              const SizedBox(width: AppSize.s40),
              // adding right arrow
              GestureDetector(
                onTap: () async {
                  await _pagecontroller
                      .animateToPage(_viewModel.currentIndex,
                          duration: const Duration(
                            microseconds: DurationConstant.d300,
                          ),
                          curve: Curves.bounceIn)
                      .then((value) => _viewModel.getToggleForword());
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

import 'dart:async';
import 'dart:developer';

import 'package:complete_advance_flutter/presentation/base/baseviewmodel.dart';
import 'package:complete_advance_flutter/domain/slider_obj_model.dart';

import '../../Resources/assets_manager.dart';
import '../../Resources/strings_manager.dart';

class OnboardingBaseViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  // adding stream controller
  final StreamController<SliderViewObject> _streamController =
      StreamController();
  List<SliderObject>? _list;
  @override
  void onStart() {
    // TODO: implement onStart
    _list = getSliderList;
    _postDataToView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  getToggleForword() {
    // TODO: implement getToggleForword
    int netxIndex = currentIndex++;
    if (netxIndex >= _sliderList.length) {
      currentIndex = 0;
    }
    _postDataToView();
  }

  @override
  getToggleBack() {
    // TODO: implement getToggleBack
    int previousIndex = currentIndex--;
    if (previousIndex == -1) {
      currentIndex = _sliderList.length - 1;
    }
    _postDataToView();
  }

  @override
  onPageChanged(int index) {
    // TODO: implement onPageChanged
    currentIndex = index;
  }

  // output
  @override
  // TODO: implement outputSliderViewModel
  Stream<SliderViewObject> get outputSliderViewModel =>
      _streamController.stream.map(
        (sliderviewobject) => sliderviewobject,
      );

  // input
  @override
  // TODO: implement inputSliderViewModel
  Sink<SliderViewObject> get inputSliderViewModel => _streamController.sink;

// getters
  List<SliderObject> get getSliderList => _sliderList;

//  private variables
  var currentIndex = 0;
  // private data
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
  //  private function

  _postDataToView() {
    inputSliderViewModel.add(
      SliderViewObject(
        SliderObject: _sliderList[currentIndex],
        numOfSlides: _sliderList.length,
        currentIndex: currentIndex,
      ),
    );
  }
}

abstract class OnboardingViewModelInputs {
  getToggleForword();
  getToggleBack();
  onPageChanged(int index);
  // adding input sink
  Sink get inputSliderViewModel; // a way to add stream to input class

}

abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewModel;
}

// creating sliderviewObject

class SliderViewObject {
  final SliderObject;
  final int numOfSlides;
  final int currentIndex;

  SliderViewObject({
    required this.SliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}

import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/style_manager.dart';
import 'package:complete_advance_flutter/domain/slider_obj_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Resources/values_manager.dart';

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  OnBoardingPage({
    required this.sliderObject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Container(
        height: 400,
        color: ColorManager.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                sliderObject.title,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                sliderObject.subTitle,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: AppSize.s60,
            ),
            SvgPicture.asset(sliderObject.image),
          ],
        ),
      ),
    );
  }
}

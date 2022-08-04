import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnBoardingBottomContainer extends StatelessWidget {
  const OnBoardingBottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          )
        ],
      ),
    );
  }
}

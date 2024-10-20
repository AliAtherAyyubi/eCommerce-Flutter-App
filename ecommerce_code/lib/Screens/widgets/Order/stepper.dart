import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderStepper extends StatefulWidget {
  // OrderStepper({super.key});

  int currentStepNo;
  OrderStepper({required this.currentStepNo});

  @override
  State<OrderStepper> createState() => _OrderStepperState();
}

class _OrderStepperState extends State<OrderStepper> {
  bool checkStep(int stepNo) {
    return widget.currentStepNo >= stepNo ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 100.w,
      child: EasyStepper(
        activeStep: widget.currentStepNo,
        showScrollbar: false,
        lineStyle: LineStyle(
            lineLength: 11.w,
            lineType: LineType.normal,
            unreachedLineType: LineType.dashed,
            defaultLineColor: AppColor.grey500,
            finishedLineColor: AppColor.primary,
            lineSpace: 8,
            lineThickness: 2),
        enableStepTapping: false,
        showLoadingAnimation: false,
        stepShape: StepShape.rRectangle,
        activeStepBackgroundColor: Colors.white,
        finishedStepBackgroundColor: Colors.white,
        internalPadding: 0,
        stepRadius: 28,
        showStepBorder: false,
        disableScroll: true,
        // lineDotRadius: 1.5,
        steps: [
          EasyStep(
            customStep: Steps(
              icon: 'assets/icons/packed.png',
              isFinish: checkStep(0),
            ),
          ),
          EasyStep(
            customStep: Steps(
              icon: 'assets/icons/shipped2.png',
              isFinish: checkStep(1),
            ),
          ),
          EasyStep(
            customStep: Steps(
              icon: 'assets/icons/onWay.png',
              isFinish: checkStep(2),
            ),
          ),
          EasyStep(
            customStep: Steps(
              icon: 'assets/icons/delievered.png',
              isFinish: checkStep(3),
            ),
          ),
        ],
        onStepReached: (index) => setState(() => widget.currentStepNo = index),
      ),
    );
  }
}

class Steps extends StatelessWidget {
  final bool isFinish;
  final String icon;
  // final String stepNo;

  Steps({this.isFinish = false, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          icon,
          height: 30,
          width: 28,
          fit: BoxFit.contain,
          color: isFinish ? AppColor.primary : AppColor.grey500,
        ),
        SizedBox(
          height: 10,
        ),
        CircleAvatar(
            radius: 8,
            backgroundColor: isFinish ? AppColor.primary : AppColor.grey500,
            child: const Icon(
              Icons.check,
              size: 10,
              color: Colors.white,
            )),
      ],
    );
  }
}

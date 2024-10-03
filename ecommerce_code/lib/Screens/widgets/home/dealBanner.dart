import 'dart:async';

import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DealBannerW extends StatefulWidget {
  String title;
  Color? bgClr;
  IconData icon;
  String? date;
  final int durationInDays;
  final VoidCallback? onBtnTap;

  DealBannerW(
      {super.key,
      required this.icon,
      this.bgClr,
      required this.title,
      this.date,
      this.onBtnTap,
      required this.durationInDays});

  @override
  State<DealBannerW> createState() => _DealBannerWState();
}

class _DealBannerWState extends State<DealBannerW> {
  late int remainingSeconds;
  Timer? timer;
  //
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  // Format the remaining time into hours, minutes, and seconds
  String formatTime(int seconds) {
    int days = seconds ~/ (24 * 3600);
    int hours = (seconds % (24 * 3600)) ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${days}d ${hours}h ${minutes}m ${secs}s remaining';
  }

  //
  @override
  void initState() {
    super.initState();
    if (widget.date == null) {
      remainingSeconds = widget.durationInDays * 24 * 60 * 60;

      startTimer();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: widget.bgClr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppTypo.medium12.copyWith(
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),

              SizedBox(
                height: 5,
              ),

              ///
              Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 21,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.date ?? formatTime(remainingSeconds),
                    style: AppTypo.regular14.copyWith(
                      fontSize: 12,
                      color: AppColor.white,
                    ),
                  ),
                ],
              )
            ],
          )),
          //
          PrimaryButton(
            onTap: widget.onBtnTap ?? () {},
            text: 'View all',
            isBorder: true,
            fontSize: 14,
            width: 31.w,
            height: 40,
            borderRadius: 10,
            suffixIcon: FontAwesomeIcons.arrowRight,
            bgColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}

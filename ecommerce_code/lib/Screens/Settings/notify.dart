import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/Typo.dart';
import 'package:flutter/material.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Notifications',
        ),
      ),
      body: ListView(
        padding: AppLayout.screenSpace,
        children: [
          SizedBox(
            height: 10,
          ),
          NotifySwitch(
            title: 'App Notification',
          ),
          NotifySwitch(
            title: 'Email Notification',
          ),
          NotifySwitch(
            title: 'SMS Notification',
          ),
        ],
      ),
    );
  }
}

class NotifySwitch extends StatefulWidget {
  String title;
  NotifySwitch({super.key, required this.title});

  @override
  State<NotifySwitch> createState() => _NotifySwitchState();
}

class _NotifySwitchState extends State<NotifySwitch> {
  bool isSelected = true;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          widget.title,
          style: AppTypo.medium14,
        )),
        Switch(
          value: isSelected,
          onChanged: toggleSwitch,
          activeColor: AppColor.primary,
          inactiveTrackColor: AppColor.grey,
          trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          thumbColor: MaterialStateProperty.all(Colors.white),
        ),
      ],
    );
  }
}

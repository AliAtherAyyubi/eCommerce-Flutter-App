import 'package:ecommerce_code/Screens/Settings/address.dart';
import 'package:ecommerce_code/Screens/Settings/notify.dart';
import 'package:ecommerce_code/Screens/Settings/passwrod.dart';
import 'package:ecommerce_code/Screens/Settings/pay_method.dart';
import 'package:ecommerce_code/Screens/Settings/profile.dart';
import 'package:ecommerce_code/Screens/widgets/Components/alert.dart';
import 'package:ecommerce_code/Screens/widgets/Settings/settingTile.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart'; // Assuming you have this for AppColor

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'My Account',
          isleading: false,
        ),
      ),
      body: ListView(
        padding: AppLayout.screenSpace,
        children: [
          Text(
            "General",
            style: AppTypo.bold
                .copyWith(fontSize: 18), // AppTypo for section heading
          ),
          SizedBox(height: 10),
          SettingsTile(
            icon: Icons.person,
            title: 'Account Details',
            subtitle: 'Edit your account information',
            onTap: () {
              Get.to(UserProfile(), transition: Transition.rightToLeft);
              // Navigate to account details page
            },
          ),
          SettingsTile(
            icon: Icons.credit_card,
            title: 'Payment Method',
            subtitle: 'Add your credit or debit card',
            onTap: () {
              // Navigate to payment method page
              Get.to(PaymentMethodSetting(),
                  transition: Transition.rightToLeft);
            },
          ),
          SettingsTile(
            icon: Icons.location_on,
            title: 'Delivery Addresses',
            subtitle: 'Edit or add new address',
            onTap: () {
              // Navigate to delivery addresses page
              Get.to(DeliveryAddressScreen(),
                  transition: Transition.rightToLeft);
            },
          ),
          SettingsTile(
            icon: Icons.security,
            title: 'Security & Password',
            subtitle: 'Edit your password',
            onTap: () {
              // Navigate to security and password page
              // Navigate to delivery addresses page
              Get.to(PasswrodScreen(), transition: Transition.rightToLeft);
            },
          ),
          SizedBox(height: 20),
          Text(
            "Setting",
            style: AppTypo.bold
                .copyWith(fontSize: 18), // AppTypo for section heading
          ),
          SizedBox(height: 10),
          SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Manage your notifications',
            onTap: () {
              // Navigate to notifications page
              Get.to(NotifyScreen(), transition: Transition.rightToLeft);
            },
          ),
          SettingsTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'Change language',
            onTap: () {
              // Navigate to language settings page
            },
          ),
          SettingsTile(
            icon: Icons.privacy_tip,
            title: 'Privacy & Policy',
            subtitle: 'Read privacy policy',
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
          SettingsTile(
            icon: Icons.call,
            title: 'Contact Us',
            subtitle: 'Reach out for support',
            onTap: () {
              // Navigate to contact us page
            },
          ),
          SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {
                // Log out functionality
                Alert.msgBox(context);
              },
              child: Text(
                'Log Out',
                style: AppTypo.semibold14.copyWith(
                    color: AppColor.primary), // AppTypo for log out button
              ),
            ),
          ),
        ],
      ),
    );
  }
}

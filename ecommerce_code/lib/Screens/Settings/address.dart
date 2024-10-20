import 'package:ecommerce_code/Screens/Settings/addAddress.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/checker.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeliveryAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Delievery Address',
        ),
      ),
      body: ListView(
        padding: AppLayout.screenSpace,
        children: [
          _buildAddressCard(
            context,
            title: 'HOME',
            address: '2280 Wiseman Street',
            subtitle: 'Fort Benning, Georgia, United States\n865-512-8826',
            isSelected: true,
          ),
          SizedBox(height: 16),
          _buildAddressCard(
            context,
            title: 'WORK',
            address: '2687 Daylene Drive',
            subtitle: 'Southfield, Michigan, United States\n734-593-5421',
            isSelected: false,
          ),
          SizedBox(height: 16),
          PrimaryButton(
            onTap: () {
              Get.to(AddAddressScreen(), transition: Transition.rightToLeft);
            },
            text: 'Add New Address',
            borderRadius: 20,
            textStyle: AppTypo.button2,
          )
        ],
      ),
    );
  }

  Widget _buildAddressCard(
    BuildContext context, {
    required String title,
    required String address,
    required String subtitle,
    required bool isSelected,
  }) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColor.secondary,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTypo.semibold14.copyWith(
                            fontSize: 12,
                            color: Colors.white), // SemiBold for title
                      ),
                    ),
                    Spacer(),
                    CheckBox(
                      isSelected: isSelected,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  address,
                  style: AppTypo.semibold14
                      .copyWith(color: Colors.white), // Regular 14 for address
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTypo.regular12.copyWith(
                    color: AppColor.white,
                  ), // Regular 12 for subtitle
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    PrimaryButton(
                      onTap: () {},
                      text: 'Edit Address',
                      isBorder: true,
                      borderRadius: 20,
                      width: 60.w,
                      bgColor: Colors.transparent,
                      textStyle: AppTypo.semibold14
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 55,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(Icons.more_horiz, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (!isSelected)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.lightGrey
                    .withOpacity(0.4), // Semi-transparent overlay
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
      ],
    );
  }
}

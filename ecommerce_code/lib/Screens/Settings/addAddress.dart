import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/Typo.dart'; // Assuming your AppTypo class is here
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});
  TextEditingController searchLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Add New Address',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: 100.w,
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/map.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SearchInput(
          textController: searchLocation,
          hintText: 'Search',
          // fillColor: AppColor.secondary,
          onTap: () {
            _showLocationDetailsSnackbar(context);
          },
        ),
      ),
    );
  }

  void _showLocationDetailsSnackbar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColor.grey500,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Location Details',
                style: AppTypo.semibold14.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              AuthField(
                hintText: 'Address',
                controller: searchLocation,
              ),
              AuthField(
                hintText: 'Landmark',
                controller: searchLocation,
              ),
              const SizedBox(height: 16),
              Center(
                child: PrimaryButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: 'Save Address',
                  textStyle: AppTypo.button2,
                  borderRadius: 10,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

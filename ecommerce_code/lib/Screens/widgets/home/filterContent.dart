import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterContent extends StatefulWidget {
  @override
  _FilterContentState createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  double endValue = 3000;
  double startValue = 100;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Row(
          children: [
            GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Filter',
                  style: AppTypo.bold.copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Categories',
          style: AppTypo.semibold14,
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10.0,
          children: [
            _buildCategoryChip('Office Chairs'),
            _buildCategoryChip('Color Chair'),
            _buildCategoryChip('Wing Chair'),
            _buildCategoryChip('Room Chair'),
            _buildCategoryChip('Bentwood Chair'),
            _buildCategoryChip('Beds'),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Price',
          style: AppTypo.semibold14,
        ),
        SizedBox(height: 10),
        Column(
          children: [
            RangeSlider(
              values: RangeValues(startValue, endValue),
              min: 100,
              max: 3000,
              divisions: null,
              labels: null,
              activeColor: AppColor.primary2,
              onChanged: (RangeValues values) {
                setState(() {
                  startValue = values.start;
                  endValue = values.end;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${startValue.toStringAsFixed(0)}', // Min value
                    style: AppTypo.semibold14.copyWith(fontSize: 12),
                  ),
                  Text(
                    '\$${endValue.toStringAsFixed(0)}',
                    style: AppTypo.semibold14.copyWith(fontSize: 12),
                    // Max value that updates dynamically
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onTap: () {
                setState(() {
                  startValue = 100;
                  endValue = 3000;
                });
              },
              title: 'Clear',
              bgColor: Colors.white,
              borderRadius: 50,
              width: 40.w,
              height: 55,
              border: Border.all(color: Colors.black),
            ),
            PrimaryButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'Apply',
              width: 40.w,
              textStyle: AppTypo.button2,
              borderRadius: 50,
            )
          ],
        ),
      ],
    );
  }

  String? selectedCategory;
  Widget _buildCategoryChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedCategory == label,
      onSelected: (bool isSelected) {
        setState(() {
          selectedCategory =
              isSelected ? label : null; // Update selected category
        });
      },
      labelStyle: AppTypo.medium12,

      selectedColor: AppColor.primary,
      checkmarkColor: Colors.white,

      // Color when selected
      backgroundColor: Colors.grey[200], // Default background color
    );
  }
}

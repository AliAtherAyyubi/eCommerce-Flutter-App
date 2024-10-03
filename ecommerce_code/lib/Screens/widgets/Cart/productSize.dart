import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final List<String> euSizeList = ['38', '39', '40', '41', '42', '43'];
  final List<String> usSizeList = ['7', '8', '9', '10'];
  final List<String> ukSizeList = ['6', '7', '8', '9'];

  // SizeSelector({
  //   Key? key,
  //   required this.euSizeList,
  //   required this.usSizeList,
  //   required this.ukSizeList,
  // }) : super(key: key);

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int _currentIndex = 0;
  int _selectedSystemIndex = 0; // 0 for EU, 1 for US, 2 for UK

  List<String> get _currentSizeList {
    switch (_selectedSystemIndex) {
      case 1:
        return widget.usSizeList;
      case 2:
        return widget.ukSizeList;
      default:
        return widget.euSizeList;
    }
  }

  String get _currentSystem {
    switch (_selectedSystemIndex) {
      case 1:
        return "US";
      case 2:
        return "UK";
      default:
        return "EU";
    }
  }

  bool checkIndex(int index) => index == _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display selected size with the current system

        SizedBox(height: 10),
        // Size system toggle (EU, US, UK)
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Size',
                style: AppTypo.semibold14.copyWith(fontSize: 16),
              ),
            ),
            _buildSizeSystemToggle("EU", 0),
            _buildSizeSystemToggle("US", 1),
            _buildSizeSystemToggle("UK", 2),
          ],
        ),
        SizedBox(height: 10),
        // Display sizes
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _currentSizeList.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: AnimatedContainer(
                  height: 40,
                  margin: EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:
                        checkIndex(index) ? AppColor.secondary : Colors.white,
                    border: Border.all(color: AppColor.secondary, width: 1.5),
                  ),
                  child: Text(
                    _currentSizeList[index],
                    style: AppTypo.semibold14.copyWith(
                      color:
                          checkIndex(index) ? Colors.white : AppColor.secondary,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Size system toggle button (EU, US, UK)
  Widget _buildSizeSystemToggle(String label, int systemIndex) {
    bool isSelected = _selectedSystemIndex == systemIndex;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedSystemIndex = systemIndex;
          _currentIndex = 0; // Reset size index when changing system
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        duration: const Duration(milliseconds: 200),
        child: Text(
          label,
          style: AppTypo.semibold14.copyWith(
            color: isSelected ? AppColor.black : AppColor.lightGrey,
          ),
        ),
      ),
    );
  }
}

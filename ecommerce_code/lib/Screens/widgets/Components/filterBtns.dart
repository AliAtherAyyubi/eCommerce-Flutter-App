import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterBtnsRow extends StatelessWidget {
  String title;
  VoidCallback sortFunc;
  VoidCallback filterFunc;
  FilterBtnsRow(
      {super.key,
      required this.title,
      required this.sortFunc,
      required this.filterFunc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          style: AppTypo.semibold14.copyWith(fontSize: 18),
        )),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: CustomButton(
                    onTap: sortFunc,
                    suffixIcon: Icon(
                      FontAwesomeIcons.sort,
                      size: 16,
                    ),
                    title: 'Sort'),
              ),
              CustomButton(
                  onTap: filterFunc,
                  suffixIcon: Icon(
                    FontAwesomeIcons.filter,
                    size: 16,
                  ),
                  title: 'Filter'),
            ],
          ),
        )
      ],
    );
  }
}

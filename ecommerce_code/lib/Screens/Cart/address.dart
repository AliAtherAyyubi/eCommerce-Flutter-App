import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserAddress extends StatelessWidget {
  String? address;
  UserAddress({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 20,
                    offset: Offset(0, 4), // Bottom shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, -2), // Top shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Address:',
                          style: AppTypo.medium12,
                        ),
                        SizedBox(height: 10),
                        Text(
                          address ??
                              '123, Flutter Street\nMobile City, CodeLand',
                          style: AppTypo.regular.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      FontAwesomeIcons.edit,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 25),
          // Plus container
          Expanded(
            flex: 4,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4), // Bottom shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, -2), // Top shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Image.asset(
                  'assets/icons/plus.png',
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  // Handle add action
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

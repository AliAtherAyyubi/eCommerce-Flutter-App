import 'package:ecommerce_code/Screens/Home/salesCard.dart';
import 'package:ecommerce_code/Screens/widgets/Components/avatar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/logo.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Screens/widgets/home/fashionCard.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.screenClr,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: HomeAppBar(
            searchController: _searchController,
          ),
        ),

        ///////// Body  //////
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'All Featured',
                  style: AppTypo.semibold14.copyWith(fontSize: 18),
                )),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: CustomButtons(
                            onTap: () {},
                            icon: FontAwesomeIcons.sort,
                            title: 'Sort'),
                      ),
                      CustomButtons(
                          onTap: () {},
                          icon: FontAwesomeIcons.filter,
                          title: 'Filter'),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      // offset: const Offset(12, 26),
                      blurRadius: 10,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(0.2)),
                ],
              ),
              width: 90.w,
              height: 120, // Adjust the height as needed
              child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return FashionItemsWidget(
                      onTap: () {},
                      image: items[index]['image'],
                      title: items[index]['title'],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SalesAdCard()
          ],
        ));
  }
}

final List<Map<String, dynamic>> items = [
  {'image': 'assets/components/beauty.png', 'title': 'Beauty'},
  {'image': 'assets/components/fashion.png', 'title': 'Fashion'},
  {'image': 'assets/components/kids.png', 'title': 'Kids'},
  {'image': 'assets/components/mens.png', 'title': 'Mens'},
  {'image': 'assets/components/women.png', 'title': 'Womens'},
];

class HomeAppBar extends StatelessWidget {
  TextEditingController searchController;
  HomeAppBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        leading: CircleAvatar(
          backgroundColor: AppColor.lightGrey3,
          radius: 2,
          child: Image.asset(
            'assets/icons/menu.png',
            fit: BoxFit.cover,
          ),
        ),
        title: MyLogo(
          height: 60,
          width: 100,
        ),
        actions: [Avatar()],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SearchInput(
              textController: searchController,
              hintText: 'Search any Product...'),
        ),
        backgroundColor: AppColor.white,
      ),
    );
  }
}

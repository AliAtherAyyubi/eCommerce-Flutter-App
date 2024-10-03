import 'package:ecommerce_code/Screens/Cart/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/widgets/Components/filterBtns.dart';
import 'package:ecommerce_code/Screens/widgets/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
  final TextEditingController _searchController = TextEditingController();
  int itemCount = 52086;
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(
            height: 15,
          ),
          FilterBtnsRow(
              title: '$itemCount+ items', sortFunc: () {}, filterFunc: () {}),
          SizedBox(
            height: 10,
          ),
          //
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items in a row
                  crossAxisSpacing: 20, // Spacing between columns
                  mainAxisSpacing: 20, // Spacing between rows
                  childAspectRatio: 0.6, // Adjust the item height/width ratio
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductDetailScreen();
                      }));
                    },
                    child: ProductCard(
                      title: 'Mens Starry',
                      description:
                          'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
                      price: 10,
                      oldPrice: 20,
                      discount: 25,
                      rating: 5,
                      borderRadius: 10,
                      isimageRadius: true,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

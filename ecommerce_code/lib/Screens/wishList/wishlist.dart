import 'package:ecommerce_code/API/fetch.dart';
import 'package:ecommerce_code/Screens/Products/AllProducts.dart';
import 'package:ecommerce_code/Screens/Products/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/filterBtns.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/loading.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redacted/redacted.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> productMap = [];
  Future<void> fetchProducts() async {
    productMap = await Store().fetchProducts();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CustomAppBar(
          title: 'Wishlist',
          isleading: false,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: AppLayout.screenSpace,
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 10,
          ),

          //
          ProductListing(
            itemCount: 3,
            isfavourite: true,
          )
        ],
      ),
    );
  }
}

import 'package:ecommerce_code/API/fetch.dart';
import 'package:ecommerce_code/Screens/Cart/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/Home/AllProducts.dart';
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
        padding: AppLayout.screenSpace,
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 10,
          ),

          //
          ProductListing(
            itemCount: 7,
            isfavourite: true,
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 50,
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('hello'),
          Text('hello'),
          Text('hello'),
          SizedBox(
            height: 10,
          ),
          // PrimaryButton(
          //   onTap: () {},
          //   text: 'Redacted',
          //   width: 80.w,
          // )
        ],
      ),
    );
  }
}

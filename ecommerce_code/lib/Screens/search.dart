import 'package:ecommerce_code/API/fetch.dart';
import 'package:ecommerce_code/Screens/Cart/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/Home/AllProducts.dart';
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

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  int itemCount = 0;
  List<dynamic> productMap = [];
  Future<void> fetchProducts() async {
    productMap = await Store().fetchProducts();
    itemCount = productMap.length;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

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
        padding: AppLayout.screenSpace,
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 10,
          ),
          FilterBtnsRow(
              title: '$itemCount + items', sortFunc: () {}, filterFunc: () {}),
          SizedBox(
            height: 10,
          ),
          //
          ProductListing(),
        ],
      ),
    );
  }
}

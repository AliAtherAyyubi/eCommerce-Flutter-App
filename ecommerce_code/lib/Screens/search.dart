import 'package:ecommerce_code/API/fetch.dart';
import 'package:ecommerce_code/Screens/Products/AllProducts.dart';
import 'package:ecommerce_code/Screens/Products/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/widgets/Components/filterBtns.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/loading.dart';
import 'package:ecommerce_code/Screens/widgets/home/fashionCard.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
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
  final TextEditingController searchController = TextEditingController();

  int itemCount = 0;
  List<dynamic> productMap = [];
  bool loading = true;
  //
  Future<void> fetchProducts() async {
    productMap = await Store().fetchProducts();
    itemCount = productMap.length;
    loading = false;
    setState(() {});
  }

  //
  Future<void> searchProducts(String query) async {
    setState(() {
      loading = true;
    });
    productMap = await Store().searchProducts(query);
    itemCount = productMap.length;
    setState(() {
      loading = false;
    });
  }

  //
  Future<void> getByCategory(String category) async {
    setState(() {
      loading = true;
    });
    productMap = await Store().getProductByCategory(category);
    itemCount = productMap.length;
    setState(() {
      loading = false;
    });
  }

  //
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
          searchController: searchController,
          onSubmit: () async {
            await searchProducts(searchController.text);
          },
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
              title: '$itemCount items', sortFunc: () {}, filterFunc: () {}),
          SizedBox(
            height: 10,
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
            width: 100.w,
            height: 120, // Adjust the height as needed
            child: Align(
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return FashionItemsWidget(
                    onTap: () async {
                      await getByCategory(items[index]['category']);
                    },
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
          //
          loading
              ? Loader()
              : productMap.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items in a row
                        crossAxisSpacing: 15, // Spacing between columns
                        mainAxisSpacing: 15, // Spacing between rows
                        childAspectRatio:
                            0.6, // Adjust the item height/width ratio
                      ),
                      itemCount: productMap.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          productData: productMap[index],
                          borderRadius: 10,
                          isimageRadius: true,
                        );
                      })
                  : Center(
                      child: Text(
                        'Not Found',
                        style: AppTypo.bold,
                      ),
                    ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> items = [
  {
    'image': 'assets/components/beauty.png',
    'title': 'Beauty',
    'category': 'beauty'
  },
  {
    'image': 'assets/components/fashion.png',
    'title': 'Fashion',
    'category': "mens-shirts"
  },
  {
    'image': 'assets/components/furniture.jpg',
    'title': 'Furniture',
    'category': "furniture"
  },
  {
    'image': 'assets/components/mens.png',
    'title': 'Mens',
    'category': "mens-shirts"
  },
  {
    'image': 'assets/components/women.png',
    'title': 'Womens',
    'category': "womens-dresses"
  },
];

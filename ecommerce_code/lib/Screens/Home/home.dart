import 'package:ecommerce_code/API/fetch.dart';
import 'package:ecommerce_code/Screens/Products/AllProducts.dart';
import 'package:ecommerce_code/Screens/Products/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/Home/product.dart';
import 'package:ecommerce_code/Screens/Home/salesCard.dart';
import 'package:ecommerce_code/Screens/Home/sponserCard.dart';
import 'package:ecommerce_code/Screens/widgets/Components/avatar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/filterBtns.dart';
import 'package:ecommerce_code/Screens/widgets/Components/loading.dart';
import 'package:ecommerce_code/Screens/widgets/Components/logo.dart';
import 'package:ecommerce_code/Screens/widgets/Components/textfield.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/home/dealBanner.dart';
import 'package:ecommerce_code/Screens/widgets/home/fashionCard.dart';
import 'package:ecommerce_code/Screens/widgets/home/offerBanner.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: AppColor.screenClr,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: HomeAppBar(
              searchController: _searchController,
            ),
          ),

          ///////// Body  //////
          body: ListView(
            scrollDirection: Axis.vertical,
            padding: AppLayout.screenSpace,
            children: [
              SizedBox(
                height: 15,
              ),
              FilterBtnsRow(
                  title: 'All Featured', sortFunc: () {}, filterFunc: () {}),
              //
              SizedBox(
                height: 15,
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
              SalesAdCard(),
              SizedBox(
                height: 10,
              ),
              DealBannerW(
                title: 'Deal of the Day',
                bgClr: AppColor.lightBlue,
                icon: Icons.alarm,
                durationInDays: 2,
              ),
              SizedBox(
                height: 10,
              ),
              TrendingProducts(
                trend: 'shoes',
              ),

              SizedBox(
                height: 15,
              ),
              SpecialOfferBanner(),
              const SizedBox(
                height: 15,
              ),
              HomeProductCard(),
              //
              SizedBox(
                height: 15,
              ),
              DealBannerW(
                title: 'Trending Products',
                date: 'Last Date 12/08/24',
                bgClr: AppColor.primary2,
                icon: Icons.calendar_month_outlined,
                durationInDays: 10,
              ),
              SizedBox(
                height: 10,
              ),
              /////////
              TrendingProducts(
                trend: 'phone',
              ),
              SizedBox(
                height: 10,
              ),
              SummerSaleCard(),
              SizedBox(
                height: 10,
              ),
              SponsoredCard(),
              SizedBox(
                height: 10,
              ),
              // ProductListing()
            ],
          )),
    );
  }
}

final List<Map<String, dynamic>> items = [
  {'image': 'assets/components/beauty.png', 'title': 'Beauty'},
  {'image': 'assets/components/fashion.png', 'title': 'Fashion'},
  {'image': 'assets/components/kids.png', 'title': 'Kids'},
  {'image': 'assets/components/mens.png', 'title': 'Mens'},
  {'image': 'assets/components/women.png', 'title': 'Womens'},
];

class TrendingProducts extends StatefulWidget {
  //
  String trend;
  TrendingProducts({super.key, required this.trend});

  @override
  State<TrendingProducts> createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
  List<dynamic> productMap = [];

  Future<void> fetchProducts() async {
    productMap = await Store().searchProducts(widget.trend);
    // itemCount = productMap.length;
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
    return SizedBox(
      height: 40.h,
      child: productMap.isNotEmpty
          ? ListView.builder(
              itemCount: productMap.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // index = index + 2;

                return Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: ProductCard(
                    productData: productMap[index],
                    borderRadius: 10,
                    isimageRadius: true,
                  ),
                );
              })
          : Loader(),
    );
  }
}

import 'package:ecommerce_code/Screens/Cart/Payment/payment.dart';
import 'package:ecommerce_code/Screens/widgets/Components/avatar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/filterBtns.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/photoView.dart';
import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/prodDetailCard.dart';
import 'package:ecommerce_code/Screens/widgets/products/productInfo.dart';
import 'package:ecommerce_code/Screens/widgets/products/reviews.dart';
import 'package:ecommerce_code/Utils/Applayout.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  // String? title;
  // String? description;
  // double? price;
  // List? imageList;
  Map<String, dynamic> productData = {};

  ProductDetailScreen({super.key, required this.productData
      // required this.title,
      // this.price,
      // this.description,
      // this.imageList
      });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int imgCount = 5;

  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> product = widget.productData;

    //
    return Scaffold(
      backgroundColor: AppColor.screenClr,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Product Details',
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: AppLayout.screenSpace,
        children: [
          // SizedBox(
          //   height: 15,
          // ),
          SizedBox(
            height: 30.h,
            width: 100.w,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product['images'].length,
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImageGallery(
                            imageList: product['images'],
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50.h,
                      width: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(product['images'][index],
                            fit: BoxFit.contain, errorBuilder:
                                (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/error.jpg', // Your fallback asset image
                            height: 250,
                            width: 100.w,
                            fit: BoxFit.contain,
                          );
                        }),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              count: product['images'].length,
              activeIndex: currentIndex,
              effect: ScaleEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Color(0xffDEDBDB),
                  activeDotColor: AppColor.primary),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ProdcutDetailCard(
            productData: product,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  onTap: () {},
                  text: 'Add to Cart',
                  bgColor: AppColor.lightBlue,
                  borderRadius: 10,
                  textStyle: AppTypo.button2,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: PrimaryButton(
                onTap: () {
                  Get.to(
                      () => PaymentScreen(
                            price: product['price'],
                            shipping: 10,
                            discount: product["discountPercentage"],
                          ),
                      transition: Transition.rightToLeft);
                },
                text: 'Buy Now',
                bgColor: Colors.green,
                borderRadius: 10,
                textStyle: AppTypo.button2,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductInfoCard(
                    icon: Icons.local_shipping_outlined,
                    title: 'Shipping',
                    subtitle: product["shippingInformation"]),
                ProductInfoCard(
                    icon: Icons.verified,
                    title: 'Warranty',
                    subtitle: product["warrantyInformation"]),
                ProductInfoCard(
                    icon: Icons.autorenew,
                    title: 'Return Policy',
                    subtitle: product["returnPolicy"]),
                ProductInfoCard(
                    icon: Icons.store,
                    title: 'Stock',
                    subtitle: product["availabilityStatus"]),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Customer Reviews (${product['reviews'].length})',
            style: AppTypo.bold,
          ),
          SizedBox(
            height: 10,
          ),
          CustomerReviews(reviews: product['reviews']),
        ],
      ),
    );
  }
}

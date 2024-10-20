import 'package:ecommerce_code/Screens/Cart/Payment/payment.dart';
import 'package:ecommerce_code/Screens/widgets/Components/button.dart';
import 'package:ecommerce_code/Screens/widgets/Components/filterBtns.dart';
import 'package:ecommerce_code/Screens/widgets/Components/appBar.dart';
import 'package:ecommerce_code/Screens/widgets/Components/photoView.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:ecommerce_code/Screens/widgets/Cart/prodDetailCard.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  String? title;
  String? description;
  double? price;
  List? imageList;

  ProductDetailScreen(
      {super.key,
      required this.title,
      this.price,
      this.description,
      this.imageList});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int imgCount = 5;

  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 30.h,
            width: 100.w,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.imageList!.length,
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
                            imageList: widget.imageList!,
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
                        child: Image.network(widget.imageList![index],
                            fit: BoxFit.cover, errorBuilder:
                                (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/error.jpg', // Your fallback asset image
                            height: 250,
                            width: 100.w,
                            fit: BoxFit.cover,
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
              count: widget.imageList!.length,
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
            title: widget.title ?? "Title",
            price: widget.price ?? 15.23,
            description: widget.description,
            oldPrice: widget.price! + 20,
            discount: 10,
            rating: 56890,
          ),
          SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     ProductButtons(
          //       onTap: () {},
          //       title: 'Nearest Store',
          //       prefixIcon: Icons.location_on_outlined,
          //     ),
          //     ProductButtons(
          //       onTap: () {},
          //       title: 'VIP',
          //       prefixIcon: Icons.lock_outline_sharp,
          //     ),
          //     ProductButtons(
          //       onTap: () {},
          //       title: 'Return Policy',
          //       prefixIcon: Icons.restart_alt,
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 15,
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
                  Get.to(() => PaymentScreen(),
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
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //   decoration: BoxDecoration(
          //       color: AppColor.lightPink,
          //       borderRadius: BorderRadius.circular(10)),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Delievery In',
          //         style: AppTypo.semibold14,
          //       ),
          //       Text(
          //         '1 within Hour',
          //         style: AppTypo.semibold14.copyWith(fontSize: 21),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   'Similar to',
          //   style: AppTypo.semibold14.copyWith(fontSize: 20),
          // ),

          // FilterBtnsRow(
          //     title: '280 + items', sortFunc: () {}, filterFunc: () {}),
          // //
          // SizedBox(
          //   height: 10,
          // ),
          // SizedBox(
          //   // height: 100.h,
          //   width: 100.w,
          //   child: GridView.builder(
          //       physics: NeverScrollableScrollPhysics(),
          //       shrinkWrap: true,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2, // Number of items in a row
          //         crossAxisSpacing: 20, // Spacing between columns
          //         mainAxisSpacing: 20, // Spacing between rows
          //         childAspectRatio: 0.6, // Adjust the item height/width ratio
          //       ),
          //       itemCount: 10,
          //       itemBuilder: (context, index) {
          //         return ProductCard(
          //           title: 'Mens Starry',
          //           description:
          //               'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
          //           price: 10,
          //           oldPrice: 20,
          //           discount: 25,
          //           rating: 5,
          //           borderRadius: 10,
          //           isimageRadius: true,
          //         );
          //       }),
          // ),

          // //
          // SizedBox(
          //   height: 20,
          // )
        ],
      ),
    );
  }
}

class ProductButtons extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? prefixIcon;
  final String title;
  //
  ProductButtons({required this.onTap, this.prefixIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: title,
      prefixIcon: Icon(
        prefixIcon,
        size: 20,
        color: AppColor.darkGrey3,
      ),
      textStyle:
          AppTypo.medium12.copyWith(fontSize: 12, color: AppColor.darkGrey3),
      borderRadius: 10,
      height: 40,
      border: Border.all(color: AppColor.darkGrey3),
    );
  }
}

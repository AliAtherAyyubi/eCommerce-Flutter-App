import 'package:ecommerce_code/API/fetch.dart';
import 'package:ecommerce_code/Screens/Cart/prdouctDetail.dart';
import 'package:ecommerce_code/Screens/widgets/Components/loading.dart';
import 'package:ecommerce_code/Screens/widgets/home/productCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductListing extends StatefulWidget {
  int? itemCount;
  bool isfavourite;

  ProductListing({super.key, this.itemCount, this.isfavourite = false});

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  List<dynamic> productMap = [];
  Future<void> fetchProducts() async {
    productMap = await Store().fetchProducts();
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
    return productMap.isNotEmpty
        ? SizedBox(
            height: 100.h,
            width: 100.w,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items in a row
                  crossAxisSpacing: 15, // Spacing between columns
                  mainAxisSpacing: 15, // Spacing between rows
                  childAspectRatio: 0.6, // Adjust the item height/width ratio
                ),
                itemCount: widget.itemCount != null
                    ? widget.itemCount
                    : productMap.length,
                itemBuilder: (context, index) {
                  String title = productMap[index]['title'];
                  double price = (productMap[index]['price'] as int).toDouble();
                  String description = productMap[index]['description'];
                  return ProductCard(
                    title: title,
                    description: description,
                    price: price,
                    imageUrl: productMap[index]['images'][0],
                    oldPrice: price + 20,
                    discount: 25,
                    rating: 5,
                    borderRadius: 10,
                    isimageRadius: true,
                    isfavourite: widget.isfavourite,
                    onTap: () => Get.to(
                        ProductDetailScreen(
                          title: title,
                          price: price,
                          description: description,
                          imageList: productMap[index]['images'],
                        ),
                        transition: Transition.rightToLeft),
                  );
                }),
          )
        : Loader();
  }
}

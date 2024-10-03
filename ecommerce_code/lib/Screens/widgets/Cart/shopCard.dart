import 'package:ecommerce_code/Screens/widgets/Components/starRating.dart';
import 'package:ecommerce_code/Utils/Colors.dart';
import 'package:ecommerce_code/Utils/typo.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatefulWidget {
  final String title;
  final String image;
  final double price;
  final double? oldPrice;
  final double? discount;
  final double rating;
  final List<String>? choices;

  const ShoppingCard({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.rating,
    this.choices,
  }) : super(key: key);

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 10,
          offset: Offset(-2, 4), // Bottom shadow
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 8,
          offset: Offset(0, -2), // Top shadow
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.image, // Pass the image URL here
                  height: 150,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20),
              // Product details column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title, // Pass the title here
                      style: AppTypo.semibold14,
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            'Variations : ',
                            style: AppTypo.medium12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ...List.generate(
                            widget.choices!.length,
                            (int index) {
                              // choice chip allow us to
                              // set its properties.
                              return Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: ChoiceChip(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                  backgroundColor: Colors.white,
                                  showCheckmark: false,

                                  label: Text(
                                    '${widget.choices![index]}',
                                    style: AppTypo.medium12.copyWith(
                                        fontSize: 14,
                                        color: _value == index
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  // color of selected chip
                                  selectedColor: AppColor.primary,
                                  // selected chip value
                                  selected: _value == index,
                                  // onselected method
                                  onSelected: (bool selected) {
                                    setState(() {
                                      _value = selected ? index : null;
                                    });
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          widget.rating
                              .toStringAsFixed(1), // Pass the rating here
                          style: AppTypo.medium12,
                        ),
                        SizedBox(width: 4),
                        // Stars for rating
                        StarRatingWidget()
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColor.grey2)),
                          child: Text(
                            '\$ ${widget.price.toStringAsFixed(2)}', // Pass the price here
                            style: AppTypo.semibold14.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'upto ${widget.discount}% off', // Pass discount logic
                              style: AppTypo.medium12.copyWith(
                                  fontSize: 10, color: AppColor.dprimary),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$ ${widget.oldPrice!.toStringAsFixed(2)}', // Pass the discount price here
                              style: AppTypo.medium12.copyWith(
                                color: Color(0xffA7A7A7),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          // Price and discount row

          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Order (1) :',
                style: AppTypo.medium12,
              ),
              Text(
                '\$${widget.price.toStringAsFixed(2)}',
                style: AppTypo.semibold14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

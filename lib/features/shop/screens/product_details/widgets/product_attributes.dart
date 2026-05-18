import 'package:flutter/material.dart';
import 'package:flutterproject/common/chips/choice_chips.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/common/widgets/texts/product_price_text.dart';
import 'package:flutterproject/common/widgets/texts/product_title_text.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';

class AProductAttributes extends StatelessWidget {
  const AProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        //selected attributes pricing and description

        ARoundedContainer(
          padding: EdgeInsets.all(Asizes.md),
          backgroundColor: dark ? AColors.darkerGrey : AColors.grey,
          child: Column(
            children: [
              //title , price and stock status
              Row(
                children: [
                  const ASectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: Asizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const AProductTitleText(
                            title: 'Price :',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: Asizes.spaceBtwItems,
                          ),

                          //actual price

                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(
                            width: Asizes.spaceBtwItems,
                          ),

                          //sale price

                          AProductPriceText(price: '20'),
                        ],
                      ),

                      //stock

                      Row(
                        children: [
                          const AProductTitleText(
                            title: 'Stock :',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: Asizes.spaceBtwItems,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              //variation description

              const AProductTitleText(
                title:
                    'This is the Description of the Product and it can be upto max 4 lines .',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Asizes.spaceBtwItems,
        ),

        //attributes

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ASectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: Asizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                AChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                AChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                AChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: Asizes.spaceBtwItems,),

        // size

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ASectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: Asizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                AChoiceChip(
                  text: 'EU-34',
                  selected: true,
                  onSelected: (value) {},
                ),
                AChoiceChip(
                  text: 'EU-35',
                  selected: false,
                  onSelected: (value) {},
                ),
                AChoiceChip(
                  text: 'EU-36',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

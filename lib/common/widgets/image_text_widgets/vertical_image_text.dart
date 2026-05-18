import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';

class AVerticalImageText extends StatelessWidget {
  const AVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = false,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: Asizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              //circular icon
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(Asizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? AColors.black : AColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: isNetworkImage
                    ? Image.network(
                        image,
                        fit: BoxFit.cover,
                        color: dark ? AColors.white : AColors.dark,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image, color: AColors.dark);
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                      )
                    : Image.asset(
                        image,
                        fit: BoxFit.cover,
                        color: dark ? AColors.white : AColors.dark,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image, color: AColors.dark);
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: Asizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


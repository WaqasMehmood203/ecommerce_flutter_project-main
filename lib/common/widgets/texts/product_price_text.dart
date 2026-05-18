import 'package:flutter/material.dart';

class AProductPriceText extends StatelessWidget {
  const AProductPriceText({
    super.key,
    this.currencySign = "\$",
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
    this.textStyle,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          (isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                    decoration: lineThrough ? TextDecoration.lineThrough : null,
                  )
              : Theme.of(context).textTheme.titleLarge!.apply(
                    decoration: lineThrough ? TextDecoration.lineThrough : null,
                  )),
    );
  }
}

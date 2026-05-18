import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/list_tiles/payment_tile.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/shop/models/payment_method_model.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: AImages.paypal, name: 'PayPal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(Asizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ASectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: Asizes.spaceBtwSections,
                    ),
                    APaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: AImages.paypal, name: 'Paypal'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                    APaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: AImages.googlePay, name: 'Google Pay'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                    APaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: AImages.applePay, name: 'Apple Pay'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                    APaymentTile(
                      paymentMethod:
                          PaymentMethodModel(image: AImages.visa, name: 'VISA'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                    APaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: AImages.masterCard, name: 'Master Card'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                    APaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: AImages.paytm, name: 'Paytm'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                    APaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: AImages.creditCard, name: 'Credit Card'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                    APaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: AImages.successfulPaymentIcon, name: 'Cash on Delivery'),
                    ),
                    const SizedBox(
                      height: Asizes.spaceBtwItems / 2,
                    ),
                  ],
                ),
              ),
            ));
  }
}

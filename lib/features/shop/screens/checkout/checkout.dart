import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/order_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutterproject/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:flutterproject/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flutterproject/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutterproject/features/shop/screens/checkout/widgets/coupon.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:flutterproject/utils/helpers/pricing_calculator.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});


  @override
  Widget build(BuildContext context) {
    //variables
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final dark = AHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            children: [
              ///Items in cart
              const ACartItems(showAddRemoveButtons: false),

              const SizedBox(height: Asizes.spaceBtwSections),

              //Coupon TextField
              ACouponCode(dark: dark),
              const SizedBox(height: Asizes.spaceBtwSections),

              //Billing Section
              ARoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(Asizes.md),
                backgroundColor: dark ? AColors.black : AColors.white,
                child: const Column(
                  children: [
                    //Pricing

                    ABillingAmountSection(),
                    SizedBox(height: Asizes.spaceBtwItems),

                    // Divider

                    Divider(),
                    SizedBox(height: Asizes.spaceBtwItems),

                    // Payment Methods
                    ABillingPaymentSection(),
                    SizedBox(height: Asizes.spaceBtwItems),

                    // Address Section

                    ABillingAddressSection(),
                    SizedBox(height: Asizes.spaceBtwItems)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Asizes.defaultSpace),
        child: Obx(() {
          final subTotal = cartController.totalCartPrice.value;
          final totalAmount =
              APricingCalculator.calculateTotalPrice(subTotal, 'US');
          return ElevatedButton(
            onPressed: () {
              // Validate cart
              if (subTotal <= 0) {
                ALoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.');
                return;
              }
              // Validate address
              if (orderController.addressController.selectedAddress.value.id.isEmpty) {
                ALoaders.warningSnackBar(
                    title: 'No Address Selected',
                    message: 'Please select a shipping address to proceed.');
                return;
              }
              // Validate payment method
              if (orderController.checkoutController.selectedPaymentMethod.value.name.isEmpty) {
                ALoaders.warningSnackBar(
                    title: 'No Payment Method',
                    message: 'Please select a payment method to proceed.');
                return;
              }
              orderController.processOrder(totalAmount);
            },
            child: Text('Checkout \$$totalAmount'),
          );
        }),
      ),
    );
  }
}

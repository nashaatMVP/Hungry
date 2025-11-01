import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/features/home/data/models/topping_model.dart';
import 'package:huungry/features/home/data/repo/product_repo.dart';
import 'package:huungry/shared/custom_button.dart';
import 'package:huungry/shared/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../widgets/spicy_slider.dart';
import '../widgets/topping_card.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productImage});
  final String productImage;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
  int? selectedToppingIndex;

  List<ToppingModel> ? toppings;
  List<ToppingModel> ? options;

  ProductRepo productRepo = ProductRepo();
  Future<void> getToppings () async {
    final res = await productRepo.getToppings();
    setState(() {
      toppings = res;
    });
  }
  Future<void> getOptions () async {
    final res = await productRepo.getOptions();
    setState(() {
      options = res;
    });
  }

  @override
  void initState() {
    getToppings();
    getOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: widget.productImage.isEmpty,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          toolbarHeight: 18,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_circle_left_outlined, size: 20,color: AppColors.primary),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpicySlider(
                  value: value,
                  img: widget.productImage,
                  onChanged: (v) => setState(() => value = v),
                ),

                Gap(40),
                CustomText(text: 'Toppings', size: 18),
                Gap(10),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate( toppings?.length ?? 4 , (index) {
                      final isSelected = selectedToppingIndex == index;
                      final topping = toppings?[index];
                      if(topping == null) {
                        return CupertinoActivityIndicator();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ToppingCard(
                          color:  isSelected ? Colors.green.withOpacity(0.2) : AppColors.primary.withOpacity(0.1),
                          title: topping.name,
                          imageUrl: topping.image,
                          onAdd: () => setState(() => selectedToppingIndex = index),
                        ),
                      );
                    }),
                  ),
                ),

                Gap(25),
                CustomText(text: 'Side Options', size: 18),
                Gap(10),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(options?.length ?? 4, (index) {
                      final isSelected = selectedToppingIndex == index;

                      final option = options?[index];
                      if(option == null) {
                        return CupertinoActivityIndicator();
                      }

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ToppingCard(
                          color:  isSelected ? Colors.green.withOpacity(0.2) : AppColors.primary.withOpacity(0.1),
                          imageUrl: option.image,
                          title: option.name,
                          onAdd: () => setState(() => selectedToppingIndex = index),
                        ),
                      );
                    }),
                  ),
                ),
                Gap(200),
              ],
            ),
          ),
        ),

        bottomSheet: Container(
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withOpacity(0.7),
                AppColors.primary,
                AppColors.primary,
                AppColors.primary,
                AppColors.primary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(30),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Burger Price :', size: 15, color: Colors.white),
                    CustomText(text: '\$ 18.9', size: 20, color: Colors.white, weight: FontWeight.w700),
                  ],
                ),
                CustomButton(
                  widget:  Icon(CupertinoIcons.cart_badge_plus),
                  gap: 10,
                  height: 48,
                   color: Colors.white,
                    textColor: AppColors.primary,
                    text: 'Add To Cart',
                    onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

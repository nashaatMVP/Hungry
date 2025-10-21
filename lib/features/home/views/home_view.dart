import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/features/home/widgets/card_item.dart';
import 'package:huungry/features/home/widgets/food_catrgory.dart';
import 'package:huungry/features/home/widgets/search_field.dart';
import 'package:huungry/features/home/widgets/user_header.dart';
import 'package:huungry/features/product/views/product_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = [
    'All',
    'Combo',
    'Sliders',
    'Classic',
    'Hot',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            /// header
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              toolbarHeight: 150,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: ClipRRect(
                borderRadius:  BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 500),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(450).withOpacity(0.1),
                      // gradient:  LinearGradient(
                      //     colors: [
                      //   AppColors.primary,
                      //   AppColors.primary,
                      //   AppColors.primary.withOpacity(0.9),
                      //   AppColors.primary.withOpacity(0.9),
                      //   AppColors.primary.withOpacity(0.9),
                      //   AppColors.primary,
                      // ],
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter
                      // ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 70,right: 20,left: 20),
                  child: Column(
                    children: [
                      UserHeader(),
                      Gap(20),
                      SearchField(),
                    ],
                  ),
                ),
              ),
                ),
            ),
            ),

            /// Category
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: FoodCategory(selectedIndex: selectedIndex, category: category),
              ),
            ),

            /// GridView
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     childAspectRatio: 0.8,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                  ),
                    delegate: SliverChildBuilderDelegate(
                        childCount: 6,
                        (context , index) => GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) {
                            return ProductDetailsView();
                          })),
                          child: CardItem(
                            image: 'assets/test/test.png',
                            text: 'Cheeseburger',
                            desc: 'Wendy"s Burger',
                            rate: '4.9',
                          ),
                        ),
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

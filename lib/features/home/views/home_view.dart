import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/features/home/widgets/card_item.dart';
import 'package:huungry/features/home/widgets/food_catrgory.dart';
import 'package:huungry/features/home/widgets/search_field.dart';
import 'package:huungry/features/home/widgets/user_header.dart';
import 'package:huungry/features/product/views/product_details_view.dart';
import 'package:huungry/shared/custom_text.dart';

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
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            /// header
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              toolbarHeight: 164,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 70,right: 20,left: 20),
                child: Column(
                  children: [
                    UserHeader(),
                    Gap(10),
                    SearchField(),
                  ],
                ),
              ),
            ),

            /// Category
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: FoodCategory(selectedIndex: selectedIndex, category: category)
              ),
            ),

            /// GridView
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.79,
                  ),
                    delegate: SliverChildBuilderDelegate(
                        childCount: 6,
                        (context , index) => GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (c) {
                              return ProductDetailsView();
                            }));
                          },
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

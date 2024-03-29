import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/count_increase_or_decrease_view.dart';
import 'package:the_movie_booking_app/list_items/food_beverage_items_view.dart';
import 'package:the_movie_booking_app/pages/check_out_page.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';

class FoodAndBeverageAllPage extends StatelessWidget {
  const FoodAndBeverageAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161616),
      body: Stack(
        children: [
          /// Grid
          const Padding(
            padding: EdgeInsets.only(top: 124, right: 24, bottom: 90, left: 24),
            child: FoodBeverageGridView(),
          ),

          /// App Bar
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: kBackgroundColor,
              padding:
                  const EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// App Bar
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: kMarginXLarge,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        'Grab a bite!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: kMarginMedium3,
                      ),
                      const SizedBox(
                        width: kMarginXLarge,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CheckOutPage()),
                          );
                        },
                        child: const Text(
                          'SKIP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                            letterSpacing: -0.33,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  /// Spacer
                  const SizedBox(
                    height: 8,
                  ),
                  /// Tab Bar
                  const CustomTabBarView(),
                ],
              ),
            ),
          ),

          /// Bottom Button And Bottom Sheet
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomButtonView(),
          ),
        ],
      ),
    );
  }
}

/// Tab Bar
class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({super.key});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {

  var tabs = ["All", "Combo", "Snack", "Pop Corn", "Beverage"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: TabBar(
                // isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.center,
                tabs: tabs.map((tab){
                  return Expanded(
                    child: Text(
                      tab,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3
                      ),
                    ),
                  );
                }).toList()),
    );
  }
}


/// Bottom Button And Bottom Sheet
class BottomButtonView extends StatefulWidget {
  const BottomButtonView({super.key});

  @override
  State<BottomButtonView> createState() => _BottomButtonViewState();
}

class _BottomButtonViewState extends State<BottomButtonView> {
  var items = ["Large Cola", "Potatoes Chips"];

  bool isShowItems = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// credit items
          Visibility(
            visible: isShowItems,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      children: [
                        /// Name
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),

                        /// Count
                        const Align(
                            alignment: Alignment.center,
                            child: CountIncreaseOrDecrease()
                        ),

                        /// Price
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '1000Ks',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          /// Button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckOutPage()),
              );
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.symmetric(
                horizontal: kMarginMedium3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPrimaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Bottom Sheet
                  GestureDetector(
                    onTap: () {
                      isShowItems = !isShowItems;
                      setState(() {
                        // isShowItems = true;
                      });
                    },
                    child: SizedBox(
                      width: 55,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              kOnlineFoodIcon,
                              color: Colors.black,
                              width: 25,
                              height: 25,
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 20,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFFF0000),
                                shape: OvalBorder(),
                              ),
                              child: const Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              (isShowItems)
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down_sharp,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Spacer
                  const Spacer(),

                  /// Total Price
                  const Text(
                    '2000Ks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 16.56,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 25,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

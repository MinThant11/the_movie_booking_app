import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_movie_booking_app/list_items/count_increase_or_decrease_view.dart';
import 'package:the_movie_booking_app/list_items/food_beverage_items_view.dart';
import 'package:the_movie_booking_app/pages/check_out_page.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';

class SnackPage extends StatelessWidget {
  const SnackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSnackPageBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: kIMDBHeight,
              ),
            ),
            const SizedBox(
              width: kMarginLarge,
            ),
            const Text(
              'Grab a bite!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: kTextRegular3x,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.search,
            color: Colors.white,
            size: kMarginMedium3,
          ),
          const SizedBox(
            width: kMarginLarge,
          ),
          GestureDetector(
            onTap: () {
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
                fontSize: kTextRegular2x,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.33,
              ),
            ),
          ),
          const SizedBox(
            width: kMarginMedium3,
          ),
        ],
      ),
      body: const SnackScreenBodyView(),
    );
  }
}

class SnackScreenBodyView extends StatelessWidget {
  const SnackScreenBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Grid
        const Padding(
          padding: EdgeInsets.only(right: kMarginLarge, left: kMarginLarge),
          child: FoodBeverageGridView(),
        ),

        /// App Bar
        Container(
          color: kBackgroundColor,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            left: kMarginMedium,
            right: kMarginMedium,
          ),
          child: const CustomTabBarView(),
        ),

        /// Bottom Button And Bottom Sheet
        const Align(
          alignment: Alignment.bottomCenter,
          child: BottomButtonView(),
        ),
      ],
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
          isScrollable: true,
          automaticIndicatorColorAdjustment: false,
          indicatorColor: kPrimaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.center,
          tabs: tabs.map((tab) {
            return Expanded(
              child: Text(
                tab,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular,
                  fontWeight: FontWeight.w500,
                  height: 3,
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
      padding: const EdgeInsets.only(left: kMarginLarge, right: kMarginLarge, top: kMarginMedium1),
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kMarginMedium3),
          topRight: Radius.circular(kMarginMedium3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// credit items
          Visibility(
            visible: isShowItems,
            child: Padding(
              padding: const EdgeInsets.only(bottom: kMargin10),
              child: Column(
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: kMarginMedium),
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
                              fontSize: kTextRegular,
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
                            child: CountIncreaseOrDecrease()),

                        /// Price
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '1000Ks',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kTextRegular2x,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
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
          Row(
            children: [
              /// Bottom Sheet
              GestureDetector(
                onTap: () {
                  isShowItems = !isShowItems;
                  setState(() {
                    // isShowItems = true;
                  });
                },
                child: Container(
                  width: kMargin100,
                  height: kMargin50,
                  margin: const EdgeInsets.only(bottom: kMarginMedium3),
                  padding: const EdgeInsets.only(left: kMarginMedium2, right: kMarginMedium4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kMargin10),
                      bottomLeft: Radius.circular(kMargin10),
                    ),
                    color: kPrimaryColor,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          kOnlineFoodIcon,
                          color: Colors.black,
                          width: kMargin25,
                          height: kMargin25,
                        ),
                      ),
                      Positioned(
                        top: kMarginCardMedium2,
                        left: kMarginMedium3,
                        child: Container(
                          // width: kMarginCardMedium2,
                          // height: kMarginCardMedium2,
                          padding: const EdgeInsets.symmetric(horizontal: kMarginSmall, vertical: kMarginSmall),
                          decoration: const ShapeDecoration(
                            color: kNoTiCircleColor,
                            shape: OvalBorder(),
                          ),
                          child: const Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kTextXXSmall,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1,
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
                          size: kMargin25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckOutPage()),
                    );
                  },
                  child: Container(
                    height: kMargin50,
                    margin: const EdgeInsets.only(bottom: kMarginMedium3),
                    padding: const EdgeInsets.only(right: kMarginMedium),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kMargin10),
                        bottomRight: Radius.circular(kMargin10),
                      ),
                      color: kPrimaryColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /// Total Price
                        Text(
                          '2000Ks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: kTextRegular2x,
                            height: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        /// Spacer
                        SizedBox(
                          width: kMargin5,
                        ),
                        /// Icon
                        Icon(
                          Icons.chevron_right,
                          size: kMargin25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

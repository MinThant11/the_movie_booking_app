import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/count_increase_or_decrease_view.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class FoodBeverageGridView extends StatefulWidget {
  const FoodBeverageGridView({super.key});

  @override
  State<FoodBeverageGridView> createState() => _FoodBeverageGridViewState();
}

class _FoodBeverageGridViewState extends State<FoodBeverageGridView> {
  bool isHasCount = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: kMarginXXLarge, bottom: kMargin86),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: kMarginLarge,
            // mainAxisSpacing: kMarginMedium4,
            mainAxisExtent: kFoodItemHeight,
          ),
          itemBuilder: (context, index) {
            return const FoodBeverageItemView();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

class FoodBeverageItemView extends StatefulWidget {
  const FoodBeverageItemView({super.key});

  @override
  State<FoodBeverageItemView> createState() => _FoodBeverageItemViewState();
}

class _FoodBeverageItemViewState extends State<FoodBeverageItemView> {
  bool isHasCount = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMargin10),
      margin: const EdgeInsets.only(top: kMarginCardMedium2, bottom: kMarginCardMedium2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginMedium),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kFoodItemBackgroundTL, kFoodItemBackgroundBR],
          )),
      child: Stack(
        children: [
          /// Image
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              kOnlineFoodIcon,
              width: kFoodImageSize,
              height: kFoodImageSize,
            ),
          ),
          /// Name
          const Positioned(
            bottom: kMargin58,
            child: Text(
              'Potatoes Chips',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: kTextSmall,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          /// Price
          const Positioned(
            bottom: kMargin38,
            child: Text(
              '1000KS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: kTextSmall,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          /// Add Button
          Visibility(
            visible: !isHasCount,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isHasCount = true;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: kAddContainerHeight,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(kMarginSmall),
                  ),
                  child: const Center(
                    child: Text(
                      kAddLabel,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: kTextRegular,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          /// Count Changes
          Visibility(
            visible: isHasCount,
            child: const Align(
              alignment: Alignment.bottomRight,
              child: CountIncreaseOrDecrease(),
            ),
          )
        ],
      ),
    );
  }
}


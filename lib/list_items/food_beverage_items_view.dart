import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/count_increase_or_decrease_view.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/images.dart';

class FoodBeverageItemsView extends StatefulWidget {
  const FoodBeverageItemsView({super.key});

  @override
  State<FoodBeverageItemsView> createState() => _FoodBeverageItemsViewState();
}

class _FoodBeverageItemsViewState extends State<FoodBeverageItemsView> {
  bool isHasCount = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 5,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          mainAxisExtent: 220,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xCC666666), Color(0x66333333)],
                )),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    kOnlineFoodIcon,
                    width: 104,
                    height: 104,
                  ),
                ),
                const Positioned(
                  bottom: 58,
                  child: Text(
                    'Potatoes Chips',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 38,
                  child: Text(
                    '1000KS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
                        width: 150,
                        height: 27,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text(
                            "ADD",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
        },
      ),
    );
  }
}

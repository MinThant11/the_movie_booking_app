import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/list_items/count_increase_or_decrease_view.dart';
import 'package:the_movie_booking_app/pages/check_out_page.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';

class SnackPage extends StatelessWidget {
  final int movieId;
  final String movieName;
  final String posterPath;
  final String cinema;
  final TimeSlotVO timeSlotVO;
  final String cinemaScreen;
  final String bookingDate;
  final String seats;
  final int ticketCount;
  final int totalPrice;
  const SnackPage(
      {super.key,
      required this.movieName,
      required this.posterPath,
      required this.cinema,
      required this.cinemaScreen,
      required this.bookingDate,
      required this.seats,
      required this.ticketCount,
      required this.totalPrice,
      required this.timeSlotVO, required this.movieId});

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
                MaterialPageRoute(
                    builder: (context) => CheckOutPage(
                          movieName: movieName,
                          posterPath: posterPath,
                          cinema: cinema,
                          cinemaScreen: cinemaScreen,
                          bookingDate: bookingDate,
                          seats: seats,
                          ticketCount: ticketCount,
                          seatTotalPrice: totalPrice,
                          timeSlotVO: timeSlotVO, movieId: movieId,
                        )),
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
      body: SnackScreenBodyView(
        movieName: movieName,
        posterPath: posterPath,
        cinema: cinema,
        cinemaScreen: cinemaScreen,
        bookingDate: bookingDate,
        seats: seats,
        ticketCount: ticketCount,
        totalPrice: totalPrice,
        timeSlotVO: timeSlotVO, movieId: movieId,
      ),
    );
  }
}

class SnackScreenBodyView extends StatefulWidget {
  final int movieId;
  final String movieName;
  final String posterPath;
  final String cinema;
  final TimeSlotVO timeSlotVO;
  final String cinemaScreen;
  final String bookingDate;
  final String seats;
  final int ticketCount;
  final int totalPrice;
  const SnackScreenBodyView({
    super.key,
    required this.movieName,
    required this.posterPath,
    required this.cinema,
    required this.cinemaScreen,
    required this.bookingDate,
    required this.seats,
    required this.ticketCount,
    required this.totalPrice,
    required this.timeSlotVO, required this.movieId,
  });

  @override
  State<SnackScreenBodyView> createState() => _SnackScreenBodyViewState();
}

class _SnackScreenBodyViewState extends State<SnackScreenBodyView> {
  /// Model
  final TmbaModel _tmbaModel = TmbaModel();

  /// Snack Categories
  List<SnackCategoryVO> snackCategoryList = [];

  /// Snacks
  List<SnacksVO> snacksList = [];

  /// temporary / "Combo", "Snack", "Pop Corn", "Beverage"
  var tabs = ["All"];

  /// Selected Snacks
  List<SnacksVO> selectedSnacksList = [];

  /// State
  bool isShowItems = false;
  int totalPrice = 0;

  /// Stream Subscription
  StreamSubscription? _snacksStreamSubscription;


  @override
  void dispose() {
    _snacksStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    /// UserData From Database
    UserVO? userDataFromDatabase = _tmbaModel.getUserDataFromDatabase();

    /// Snack Categories From Network
    _tmbaModel
        .getSnackCategories(userDataFromDatabase?.token ?? '')
        .then((snackCategory) {
      setState(() {
        snackCategoryList = snackCategory;
      });
    });

    /// Snacks From Network
    _tmbaModel.getSnacks(userDataFromDatabase?.token ?? '', 0).then((snacks) {
      setState(() {
        snacksList = snacks;
      });
    });
  }

  void addCount(SnacksVO snacks) {
    snacksList = snacksList.map((snack) {
      if (snack.id == snacks.id) {
        snack.quantity = (snacks.quantity ?? 0) + 1;
        selectedSnacksList =
            snacksList.where((snacks) => ((snacks.quantity ?? 0) > 0)).toList();
        return snack;
      } else {
        return snack;
      }
    }).toList();
    totalPrice = selectedSnacksList
        .map((snacks) => (snacks.price ?? 0) * (snacks.quantity ?? 0))
        .reduce((value1, value2) => value1 + value2)
        .toInt();
  }

  void removeCount(SnacksVO snacks) {
    snacksList = snacksList.map((snack) {
      if (snack.id == snacks.id) {
        if ((snacks.quantity ?? 0) > 0) {
          snack.quantity = (snacks.quantity ?? 0) - 1;
        }
        selectedSnacksList =
            snacksList.where((snacks) => ((snacks.quantity ?? 0) > 0)).toList();
        return snack;
      } else {
        return snack;
      }
    }).toList();
    totalPrice = totalPrice - (snacks.price?.toInt() ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Grid
        Padding(
          padding:
              const EdgeInsets.only(right: kMarginLarge, left: kMarginLarge),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: kMarginXXLarge, bottom: kMargin86),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kMarginLarge,
                  // mainAxisSpacing: kMarginMedium4,
                  mainAxisExtent: kFoodItemHeight,
                ),
                itemBuilder: (context, index) {
                  return FoodBeverageItemView(
                    snacks: snacksList[index],
                    add: (snacks) {
                      setState(() {
                        addCount(snacks);
                      });
                    },
                    remove: (snacks) {
                      setState(() {
                        removeCount(snacks);
                      });
                    },
                  );
                },
                itemCount: snacksList.length,
              ),
            ),
          ),
        ),

        /// App Bar
        Container(
          color: kBackgroundColor,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            left: kMarginMedium,
            right: kMarginMedium,
          ),
          child: DefaultTabController(
            length: 5,
            child: TabBar(
                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: (snackCategoryList.isEmpty)
                    ? tabs.map((tab) {
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
                      }).toList()
                    : snackCategoryList.map((snackCategory) {
                        return Expanded(
                          child: Text(
                            snackCategory.title ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: kTextRegular,
                              fontWeight: FontWeight.w500,
                              height: 3,
                            ),
                          ),
                        );
                      }).toList()),
          ),
        ),

        /// Bottom Button And Bottom Sheet
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(
                left: kMarginLarge, right: kMarginLarge, top: kMarginMedium1),
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
                  visible: isShowItems && selectedSnacksList.isNotEmpty,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: kMargin10),
                      child: SizedBox(
                        height: 120,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return SelectedSnacksView(
                              selectedSnacks: selectedSnacksList[index],
                              add: (snacks) {
                                setState(() {
                                  addCount(snacks);
                                });
                              },
                              remove: (snacks) {
                                setState(() {
                                  removeCount(snacks);
                                });
                              },
                            );
                          },
                          itemCount: selectedSnacksList.length,
                        ),
                      )),
                ),

                /// Button
                Row(
                  children: [
                    /// Bottom Sheet
                    GestureDetector(
                      onTap: () {
                        if (selectedSnacksList.isNotEmpty) {
                          setState(() {
                            isShowItems = !isShowItems;
                          });
                        }
                      },
                      child: Container(
                        width: kMargin100,
                        height: kMargin50,
                        margin: const EdgeInsets.only(bottom: kMarginMedium3),
                        padding: const EdgeInsets.only(
                            left: kMarginMedium2, right: kMarginMedium4),
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
                            Visibility(
                              visible: selectedSnacksList.isNotEmpty,
                              child: Positioned(
                                  top: kMarginCardMedium2,
                                  left: kMarginMedium3,
                                  child: Container(
                                    width: kMarginMedium1,
                                    height: kMarginMedium1,
                                    decoration: const ShapeDecoration(
                                      color: kNoTiCircleColor,
                                      shape: OvalBorder(),
                                    ),
                                    child: Center(
                                      child: Text(
                                        selectedSnacksList.length.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: kTextXXSmall,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  )),
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

                    /// Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOutPage(
                                      movieName: widget.movieName,
                                      posterPath: widget.posterPath,
                                      cinema: widget.cinema,
                                      cinemaScreen: widget.cinemaScreen,
                                      bookingDate: widget.bookingDate,
                                      seats: widget.seats,
                                      ticketCount: widget.ticketCount,
                                      seatTotalPrice: widget.totalPrice,
                                      selectedSnacksList: selectedSnacksList,
                                      snacksTotalPrice: totalPrice,
                                      timeSlotVO: widget.timeSlotVO, movieId: widget.movieId,
                                    )),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /// Total Price
                              Visibility(
                                visible: totalPrice > 0,
                                child: Text(
                                  "${totalPrice}KS",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: kBackgroundColor,
                                    fontSize: kTextRegular2x,
                                    height: 1,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              /// Spacer
                              const SizedBox(
                                width: kMargin5,
                              ),

                              /// Icon
                              const Icon(
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
          ),
        ),
      ],
    );
  }
}

/// Selected Snacks View
class SelectedSnacksView extends StatefulWidget {
  final SnacksVO selectedSnacks;
  final Function(SnacksVO snacks) add;
  final Function(SnacksVO snacks) remove;
  const SelectedSnacksView({
    super.key,
    required this.selectedSnacks,
    required this.add,
    required this.remove,
  });

  @override
  State<SelectedSnacksView> createState() => _SelectedSnacksViewState();
}

class _SelectedSnacksViewState extends State<SelectedSnacksView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMarginMedium),
      child: Stack(
        children: [
          /// Name
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.selectedSnacks.name ?? '',
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
          Align(
              alignment: Alignment.center,
              child: CountIncreaseOrDecrease(
                getCount: widget.selectedSnacks.quantity ?? 0,
                add: () {
                  widget.add(widget.selectedSnacks);
                },
                remove: () {
                  widget.remove(widget.selectedSnacks);
                },
              )),

          /// Price
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${widget.selectedSnacks.price?.toInt()}KS",
              textAlign: TextAlign.center,
              style: const TextStyle(
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
  }
}

/// Food And Beverage Item View
class FoodBeverageItemView extends StatefulWidget {
  final SnacksVO snacks;
  final Function(SnacksVO snacks) add;
  final Function(SnacksVO snacks) remove;
  const FoodBeverageItemView({
    super.key,
    required this.snacks,
    required this.add,
    required this.remove,
  });

  @override
  State<FoodBeverageItemView> createState() => _FoodBeverageItemViewState();
}

class _FoodBeverageItemViewState extends State<FoodBeverageItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMargin10),
      margin: const EdgeInsets.only(
          top: kMarginCardMedium2, bottom: kMarginCardMedium2),
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
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                widget.snacks.image ?? '',
                width: kFoodImageSize,
                height: kFoodImageSize,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Name
          Positioned(
            bottom: kMargin58,
            child: Text(
              widget.snacks.name ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: kTextSmall,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// Price
          Positioned(
            bottom: kMargin38,
            child: Text(
              "${widget.snacks.price?.toInt()}KS",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: kTextSmall,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// Add Button
          Visibility(
            visible: (widget.snacks.quantity ?? 0) <= 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.add(widget.snacks);
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
            visible: (widget.snacks.quantity ?? 0) >= 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: CountIncreaseOrDecrease(
                getCount: widget.snacks.quantity ?? 0,
                add: () {
                  widget.add(widget.snacks);
                },
                remove: () {
                  widget.remove(widget.snacks);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

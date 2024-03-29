import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/status_view.dart';
import 'package:the_movie_booking_app/list_items/time_select_view.dart';
import 'package:the_movie_booking_app/pages/cinema_details_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../utils/images.dart';

class ChooseTimeAndCinemaPage extends StatelessWidget {
  const ChooseTimeAndCinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: kIMDBHeight,
          ),
        ),
        actions: [
          Image.asset(
            kLocationArrowIcon,
            width: kLocationIconSize,
            height: kLocationIconSize,
          ),
          const Text(
            "Yangon",
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular,
            ),
          ),
          const SizedBox(
            width: kMargin26,
          ),
          const Icon(
            Icons.search,
            color: Colors.white,
            size: kMarginLarge,
          ),
          const SizedBox(
            width: kMarginLarge,
          ),
          Image.asset(
            kFilterIcon,
            width: kFilterIconSize,
            height: kFilterIconSize,
          ),
          const SizedBox(
            width: kMarginLarge,
          ),
        ],
      ),
      body: const ScreenBodyView(),
    );
  }
}

/// ScreenViewList
class ScreenBodyView extends StatelessWidget {
  const ScreenBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Choose Date
        const SliverToBoxAdapter(
          child: ChooseDateView(),
        ),

        /// Quality
        SliverToBoxAdapter(
          child: QualityView(),
        ),

        /// Statue
        const SliverToBoxAdapter(
          child: ChooseCinemaStatusView(),
        ),

        /// Choose Cinema
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const ChooseCinema();
            },
            childCount: 7,
          ),
        )
      ],
    );
  }
}

/// Choose Date
class ChooseDateView extends StatefulWidget {
  const ChooseDateView({super.key});

  @override
  State<ChooseDateView> createState() => _ChooseDateViewState();
}

class _ChooseDateViewState extends State<ChooseDateView> {
  var items = [
    "Today\nJan\n14",
    "Tomorrow\nJan\n15",
    "TUE\nJan\n16",
    "WED\nJan\n17",
    "THU\nJan\n18",
    "FRI\nJan\n19",
    "SAT\nJan\n20"
  ];
  dynamic selectedItem;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    selectedItem = items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kMargin10),
        height: kMargin95,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: kMarginMedium2),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      kChooseDateBottom,
                      width: kMargin72,
                      height: kMargin40,
                      fit: BoxFit.fill,
                      color: (isSelected) ? kPrimaryColor : kChooseDateColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: kMargin72,
                      height: kMargin66,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(kMarginMedium),
                          topRight: Radius.circular(kMarginMedium),
                        ),
                        color: (isSelected) ? kPrimaryColor : kChooseDateColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 24.5,
                    child: Container(
                      width: kMarginMedium4,
                      height: kMargin5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kMarginMedium),
                          color: kBackgroundColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kMarginMedium3),
                    child: SizedBox(
                      width: kMargin72,
                      child: Text(
                        items[index],
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: kTextRegular,
                            fontWeight: FontWeight.w700,
                            height: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: items.length,
        ));
  }
}

/// Quality
class QualityView extends StatelessWidget {
  QualityView({super.key});

  final List<String> qualities = ["2D", "3D", "3D IMAX", "3D DBOX"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginCardMedium2, vertical: kMargin30),
      child: Wrap(
        spacing: kMarginMedium,
        runSpacing: kMarginMedium,
        children: qualities
            .map(
              (quality) => Container(
                decoration: BoxDecoration(
                  color: kNowPlayingAndComingSoonUnSelectedTextColor,
                  borderRadius: BorderRadius.circular(kMargin5),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: kMarginCardMedium2, vertical: kMargin5),
                margin: const EdgeInsets.symmetric(horizontal: kMarginMedium),
                child: Text(
                  quality,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: kTextRegular,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

/// Status
class ChooseCinemaStatusView extends StatelessWidget {
  const ChooseCinemaStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kStatusBackgroundColor,
      padding: const EdgeInsets.symmetric(
          horizontal: kMarginMedium3, vertical: kTextSmall),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatusView(
            label: kAvailableLabel,
            color: kAvailableColor,
            isHasBorder: false,
            isHasContainer: true,
          ),
          StatusView(
            label: kFillingFastLabel,
            color: kFillingFastColor,
            isHasBorder: false,
            isHasContainer: true,
          ),
          StatusView(
            label: kAlmostFullLabel,
            color: kAlmostFullColor,
            isHasBorder: false,
            isHasContainer: true,
          ),
        ],
      ),
    );
  }
}

/// Choose Cinema
class ChooseCinema extends StatefulWidget {
  const ChooseCinema({super.key});

  @override
  State<ChooseCinema> createState() => _ChooseCinemaState();
}

class _ChooseCinemaState extends State<ChooseCinema> {

  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Cinemas
        GestureDetector(
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMarginLarge, vertical: kMarginMedium3),
            child: Column(
              children: [
                /// Label
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'JCGV : Junction City',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CinemaDetailsPage()),);
                      },
                      child: const Text(
                        kSeeDetailsLabel,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium3,
                ),

                /// Icon
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatusView(
                      label: kParkingLabel,
                      color: kA6Color,
                      isHasBorder: false,
                      isHasContainer: false,
                      icon: kParkingIcon,
                    ),
                    SizedBox(
                      width: kMarginMedium2,
                    ),
                    StatusView(
                      label: kOnlineFoodLabel,
                      color: kA6Color,
                      isHasBorder: false,
                      isHasContainer: false,
                      icon: kOnlineFoodIcon,
                    ),
                    SizedBox(
                      width: kMarginMedium2,
                    ),
                    StatusView(
                      label: kWheelChairLabel,
                      color: kA6Color,
                      isHasBorder: false,
                      isHasContainer: false,
                      icon: kWheelChairIcon,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /// Time
        Visibility(
          visible: isHidden,
          child: Column(
            children: [
              /// Time Select
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
                child: TimeSelectView(),
              ),

              const SizedBox(
                height: kMarginLarge,
              ),

              /// Information
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    width: kMarginLarge,
                  ),
                  Image.asset(
                    kInformationCircleIcon,
                    width: kTextRegular2x,
                    height: kTextRegular2x,
                  ),
                  const SizedBox(
                    width: kMarginMedium,
                  ),
                  const Text(
                    "Long press on show timing to see seat class!",
                    style: TextStyle(
                      color: kA6Color,
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: kMarginMedium3,
              ),
            ],
          ),
        ),

        /// Divider
        const Divider(
          color: kUnSelectedColor,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../list_items/status_view.dart';

class CinemaDetailsPage extends StatelessWidget {
  const CinemaDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: kLocationIconSize,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Ticket Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular4x,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: FavoriteActionView(),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          SizedBox(
            height: kMovieDetailsTopImageHeight,
            child: Stack(
              children: [
                Image.asset(
                  kCinemaDetails,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: kMargin50,
                    height: kMargin50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: kMargin36,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          /// Spacer
          const SizedBox(
            height: kMarginMedium1,
          ),

          /// Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Cinema
                const Text(
                  'JCGV : Junction City',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: kMarginMedium2,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium1,
                ),

                /// Location
                Row(
                  children: [
                    const SizedBox(
                      /// ToDo: check w : 280
                      width: kMovieListItemHeight,
                      child: Text(
                        'Q5H3+JPP, Corner of, Bogyoke Lann, Yangon ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular3x,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      kLocationArrowIcon,
                      color: kPrimaryColor,
                      width: kLocationIconSize,
                      height: kLocationIconSize,
                    )
                  ],
                ),

                /// Spacer
                const SizedBox(
                  height: kMargin40,
                ),

                /// Facilities
                const FacilitiesView(),

                /// Spacer
                const SizedBox(
                  height: kMargin40,
                ),

                /// Safety
                SafetyItemsView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteActionView extends StatefulWidget {
  const FavoriteActionView({
    super.key,
  });

  @override
  State<FavoriteActionView> createState() => _FavoriteActionViewState();
}

class _FavoriteActionViewState extends State<FavoriteActionView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Icon(
        (!isSelected) ? Icons.star_border_rounded : Icons.star_rounded,
        size: kMargin30,
        color: (!isSelected) ? Colors.white : kPrimaryColor,
      ),
    );
  }
}

class FacilitiesView extends StatelessWidget {
  const FacilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Text(
          'Facilities',
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular3x,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),

        /// Spacer
        SizedBox(
          height: kMarginCardMedium2,
        ),

        /// Icons And Label
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StatusView(
              label: "Parking",
              color: kPrimaryColor,
              circleColor: kPrimaryColor,
              isHasBorder: false,
              isHasContainer: false,
              icon: kParkingIcon,
            ),
            SizedBox(
              width: kMarginMedium2,
            ),
            StatusView(
              label: "Online Food",
              color: kPrimaryColor,
              circleColor: kPrimaryColor,
              isHasBorder: false,
              isHasContainer: false,
              icon: kOnlineFoodIcon,
            ),
            SizedBox(
              width: kMarginMedium2,
            ),
            StatusView(
              label: "Wheel Chair",
              color: kPrimaryColor,
              circleColor: kPrimaryColor,
              isHasBorder: false,
              isHasContainer: false,
              icon: kWheelChairIcon,
            ),
          ],
        ),

        /// Spacer
        SizedBox(
          height: kMarginCardMedium2,
        ),

        /// Ticket Cancellation
        StatusView(
          label: "Ticket Cancellation",
          color: kPrimaryColor,
          circleColor: kPrimaryColor,
          isHasBorder: false,
          isHasContainer: false,
          icon: kTicketCancellation,
        ),
      ],
    );
  }
}

class SafetyItemsView extends StatelessWidget {
  SafetyItemsView({
    super.key,
  });

  final List safetyItems = [
    "Thermanal Scanning",
    "Contactless Security Check",
    "Sanitization Before Every Show",
    "Disposable 3D glass",
    "Contactless Food Service",
    "Package Food ",
    "Deep Cleaning of rest room",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Safety',
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular3x,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: kMarginMedium3,
        ),
        Wrap(
          spacing: kMarginMedium,
          runSpacing: kMarginMedium,
          children: safetyItems
              .map(
                (item) => Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(kMarginSmall),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: kMarginMedium, vertical: kMarginSmall),
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: kTextSmall,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

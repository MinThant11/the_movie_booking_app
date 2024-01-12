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
                  size: 30,
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
                  fontSize: 20,
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
            height: 200,
            child: Stack(
              children: [
                Image.asset(
                  kCinemaDetails,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          /// Spacer
          const SizedBox(
            height: 14,
          ),

          /// Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Cinema
                const Text(
                  'JCGV : Junction City',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),

                /// Spacer
                const SizedBox(
                  height: 14,
                ),

                /// Location
                Row(
                  children: [
                    const SizedBox(
                      width: 280,
                      child: Text(
                        'Q5H3+JPP, Corner of, Bogyoke Lann, Yangon ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
                  height: 40,
                ),

                /// Facilities
                const FacilitiesView(),

                /// Spacer
                const SizedBox(
                  height: 40,
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
        size: 30,
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
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),

        /// Spacer
        SizedBox(
          height: 12,
        ),

        /// Icons And Labelf
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
          height: 12,
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
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: kMarginMedium,
          runSpacing: kMarginMedium,
          children: safetyItems
              .map(
                (item) => Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(4),
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

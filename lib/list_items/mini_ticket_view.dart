import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import 'date_time_location_with_icon_view.dart';

class MiniTicketView extends StatelessWidget {
  const MiniTicketView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: kMarginMedium4, vertical: kMarginMedium1),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMarginMedium),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kMiniTicketColor1,
                kMiniTicketColor2,
                kMiniTicketColor3,
                kMiniTicketColor4,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      /// Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kMarginSmall),
                        child: Image.network(
                          "https://m.media-amazon.com/images/M/MV5BMzU3YTc1ZjMtZTAyOC00ZTI1LWE0MzItMTllN2M2YWI4MWZmXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_.jpg",
                          width: kMiniTicketImageWidth,
                          height: kMiniTicketImageHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                      /// Spacer
                      const SizedBox(
                        width: kMarginMedium3,
                      ),
                      /// Info
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Movie Name
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Black Widow ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular2x,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '(3D) (U/A)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular2x,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          /// Spacer
                          const SizedBox(
                            height: kMarginMedium,
                          ),

                          /// Cinema
                          const Text(
                            'JCGV : Junction City ',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: kTextRegular,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          /// Spacer
                          const SizedBox(
                            height: kMarginMedium2,
                          ),

                          /// M-Tickets
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'M-Ticket ( ',
                                  style: TextStyle(
                                    color: kA6Color,
                                    fontFamily: 'DM Sans',
                                    fontSize: kTextRegular,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '2',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: kTextRegular,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: ' )',
                                  style: TextStyle(
                                    color: kA6Color,
                                    fontSize: kTextRegular,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          /// Spacer
                          const SizedBox(
                            height: kMarginMedium2,
                          ),

                          /// Seat
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Gold-G8,G7',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular2x,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '(SCREEN 2)',
                                  style: TextStyle(
                                    color: kA6Color,
                                    fontSize: kTextRegular,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
              ),

              /// Ticket Divider
              const TicketDividerView(),

              /// Details
              const Padding(
                padding: EdgeInsets.all(kMarginMedium2),
                child: DateTimeLocationWithIconsView(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TicketDividerView extends StatelessWidget {
  const TicketDividerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            '- - - - - - - - - - - - - - - - - - - - - - - - - - - -',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kLoginPageDividerColor,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w500,
              height: kMarginXSmall,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            kTicketStart,
            height: kMargin30,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            kTicketEnd,
            height: kMargin30,
          ),
        )
      ],
    );
  }
}

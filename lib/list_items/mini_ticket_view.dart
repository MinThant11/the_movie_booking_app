import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import 'date_time_location_with_icon_view.dart';

class MiniTicketView extends StatelessWidget {
  final String movieName;
  final String posterPath;
  final String cinema;
  final TimeSlotVO timeSlotVO;
  final String seats;
  final String bookingDate;
  final int movieId;
  final List<SnacksVO> selectedSnacksList;
  const MiniTicketView({
    super.key,
    required this.movieName,
    required this.posterPath,
    required this.timeSlotVO,
    required this.seats,
    required this.bookingDate,
    required this.movieId,
    required this.selectedSnacksList,
    required this.cinema,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              horizontal: kMarginMedium4, vertical: kMarginMedium1),
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
                        posterPath,
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
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "$movieName ",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: kTextRegular2x,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
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
                        Text(
                          cinema,
                          style: const TextStyle(
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
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Normal-$seats",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: kTextRegular2x,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
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
              Padding(
                padding: const EdgeInsets.all(kMarginMedium2),
                child: DateTimeLocationWithIconsView(
                  cinemaTime: timeSlotVO.startTime ?? '',
                  bookingDate: bookingDate,
                ),
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

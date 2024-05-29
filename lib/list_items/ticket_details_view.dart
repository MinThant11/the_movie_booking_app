import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/list_items/date_time_location_with_icon_view.dart';
import 'package:the_movie_booking_app/list_items/mini_ticket_view.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class TicketDetailsView extends StatefulWidget {
  final String movieName;
  final String posterPath;
  final String cinema;
  final TimeSlotVO timeSlotVO;
  final String cinemaScreen;
  final String bookingDate;
  final String seats;
  final int ticketCount;
  final int seatTotalPrice;
  final List<SnacksVO> selectedSnacksList;
  final double snacksTotalPrice;
  final double convenienceFee;
  final double total;
  final Function(SnacksVO snacks) removeItem;
  final Color? cancellationPolicyColor;
  const TicketDetailsView({
    super.key,
    this.cancellationPolicyColor,
    required this.movieName,
    required this.posterPath,
    required this.cinema,
    required this.cinemaScreen,
    required this.bookingDate,
    required this.seats,
    required this.ticketCount,
    required this.seatTotalPrice,
    required this.selectedSnacksList,
    required this.removeItem,
    required this.snacksTotalPrice,
    required this.convenienceFee,
    required this.total,
    required this.timeSlotVO,
  });

  @override
  State<TicketDetailsView> createState() => _TicketDetailsViewState();
}

class _TicketDetailsViewState extends State<TicketDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kTicketDetailsColor1,
            kTicketDetailsColor2,
            kTicketDetailsColor3,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Movie Name
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.movieName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular3x,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' (3D) (U/A)',
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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.cinema,
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " (${widget.cinemaScreen})",
                        style: const TextStyle(
                          color: kA6Color,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                /// Spacer
                const SizedBox(
                  height: kMargin30,
                ),

                /// Details
                DateTimeLocationWithIconsView(
                  cinemaTime: widget.timeSlotVO.startTime ?? '',
                  bookingDate: widget.bookingDate,
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium2,
                ),

                /// M-Tickets
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'M-Ticket ( ',
                        style: TextStyle(
                          color: kA6Color,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: widget.ticketCount.toString(),
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
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

                /// Seat Number
                Row(
                  children: [
                    Text(
                      "Normal-${widget.seats}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${widget.seatTotalPrice}KS",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium,
                ),

                /// Divider
                const Divider(
                  color: kUnSelectedColor,
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium,
                ),

                /// Food And Beverage
                FoodAndBeverageView(
                  selectedSnacksList: widget.selectedSnacksList,
                  snacksTotalPrice: widget.snacksTotalPrice.toInt(),
                  removeItem: (snacks) {
                    widget.removeItem(snacks);
                  },
                )
              ],
            ),
          ),

          /// Ticket Divider
          const TicketDividerView(),

          Padding(
            padding: const EdgeInsets.all(kMarginLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Convenience Fee
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    const Text(
                      'Convenience Fee',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    /// Spacer
                    const SizedBox(
                      width: kMarginMedium,
                    ),

                    /// Icon
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),

                    /// Spacer
                    const Spacer(),

                    /// Total Price
                    Text(
                      "${widget.convenienceFee.toInt()}KS",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),

                /// Ticket Cancellation Policy Button
                GestureDetector(
                  onTap: () {
                    ticketCancellationPolicy(context);
                  },
                  child: Container(
                    // height: 28,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMargin10, vertical: kMarginSmall),
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    decoration: ShapeDecoration(
                      color: (widget.cancellationPolicyColor) != null
                          ? widget.cancellationPolicyColor
                          : kTicketCancellationButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kMarginMedium3),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: kTextRegular4x,
                        ),
                        SizedBox(width: kMarginSmall),
                        Text(
                          'Ticket Cancellation policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: kTextRegular,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Divider
                const Divider(
                  color: kUnSelectedColor,
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium,
                ),

                /// Total - Price
                Row(
                  children: [
                    const Text(
                      'Total',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kTextRegular3x,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${widget.total.toInt()}KS",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: kTextRegular3x,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Ticket Cancellation Policy
  void ticketCancellationPolicy(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const TicketCancellationPolicyView();
        });
  }
}

/// Ticket Cancellation Policy View
class TicketCancellationPolicyView extends StatelessWidget {
  const TicketCancellationPolicyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: kBackgroundColor,
        child: Container(
          width: kTicketCancellationDialogWidth,
          height: kTicketCancellationDialogHeight,
          padding: const EdgeInsets.all(kMarginMedium4),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(kMarginMedium),
            // border: Border.all(width: 1, color: Color(0xFF00FF6A)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Title
              const Text(
                'Ticket Cancellation Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// Spacer
              const SizedBox(
                height: kMarginMedium2,
              ),

              /// F&B Refund
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Online Food icon
                  Image.asset(
                    kOnlineFoodIcon,
                    width: kTextRegular4x,
                    height: kTextRegular4x,
                  ),

                  /// Spacer
                  const SizedBox(
                    width: kMarginMedium,
                  ),

                  /// Text
                  const Text(
                    '100% Refund on F&B',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular2x,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),

              /// Spacer
              const SizedBox(
                height: kMarginMedium1,
              ),

              /// Refund Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Ticket icon
                  Image.asset(
                    kTicketIcon,
                    width: kTextRegular4x,
                    height: kTextRegular4x,
                  ),

                  /// Spacer
                  const SizedBox(
                    width: kMarginMedium,
                  ),

                  /// Text
                  const Text(
                    'Up to 75% Refund for Tickets',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular2x,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),

              /// Spacer
              const SizedBox(
                height: kMarginMedium1,
              ),

              /// Refund
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Spacer
                  SizedBox(
                    width: kMarginLarge,
                  ),

                  /// Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '-75% refund until 2 hours before show start time',
                          style: TextStyle(
                            color: kUnSelectedColor,
                            fontSize: kTextRegular,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: kMarginMedium,
                        ),
                        Text(
                          '-50% refund between 2 hours and 20 minutes before show start time',
                          style: TextStyle(
                            color: kUnSelectedColor,
                            fontSize: kTextRegular,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

              /// Spacer
              const SizedBox(
                height: kMargin36,
              ),

              /// Policy No.1
              const Text(
                '1. Refund not available for Convenience fees,Vouchers, Gift Cards, Taxes etc.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// Spacer
              const SizedBox(
                height: kMarginCardMedium2,
              ),

              /// Policy No.2
              const Text(
                '2. No cancellation within 20minute of show start time.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// Spacer
              const SizedBox(
                height: kMargin36,
              ),

              /// Close Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: kMargin38,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(kMarginMedium),
                  ),
                  child: const Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: kTextRegular2x,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

/// Food And Beverage
class FoodAndBeverageView extends StatefulWidget {
  final List<SnacksVO> selectedSnacksList;
  final int snacksTotalPrice;
  final Function(SnacksVO snacks) removeItem;
  const FoodAndBeverageView({
    super.key,
    required this.selectedSnacksList,
    required this.snacksTotalPrice,
    required this.removeItem,
  });

  @override
  State<FoodAndBeverageView> createState() => _FoodAndBeverageViewState();
}

class _FoodAndBeverageViewState extends State<FoodAndBeverageView> {
  bool isShowItems = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isShowItems = !isShowItems;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: kMarginSmall),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Online Food icon
                Image.asset(
                  kOnlineFoodIcon,
                  width: kTextRegular4x,
                  height: kTextRegular4x,
                ),

                /// Spacer
                const SizedBox(
                  width: kMarginSmall,
                ),

                /// Title
                const Text(
                  'Food and Beverage',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: kTextRegular3x,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                /// Spacer
                const SizedBox(
                  width: kMarginMedium,
                ),

                /// Icon
                Icon(
                  (isShowItems)
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),

                /// Spacer
                const Spacer(),

                /// Total Price
                Text(
                  "${widget.snacksTotalPrice}KS",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: kTextRegular2x,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: isShowItems,
          child: Column(
            children: widget.selectedSnacksList.map((snacks) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: kMarginSmall),
                child: Row(
                  children: [
                    /// Cross icon
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.removeItem(snacks);
                        });
                      },
                      child: Image.asset(
                        kCrossIcon,
                        width: kTextRegular4x,
                        height: kTextRegular4x,
                      ),
                    ),

                    /// Spacer
                    const SizedBox(
                      width: kMarginSmall,
                    ),

                    /// Item
                    Text(
                      "${snacks.name} (Qt. ${snacks.quantity})",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kUnSelectedColor,
                        fontSize: kTextRegular,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    /// Spacer
                    const Spacer(),

                    /// Price
                    Text(
                      "${((snacks.price?.toInt() ?? 0) * (snacks.quantity ?? 0))}KS",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kUnSelectedColor,
                        fontSize: kTextRegular,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

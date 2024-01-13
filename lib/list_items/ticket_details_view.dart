import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/date_time_location_with_icon_view.dart';
import 'package:the_movie_booking_app/list_items/mini_ticket_view.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class TicketDetailsView extends StatelessWidget {
  final Color? cancellationPolicyColor;
  const TicketDetailsView({
    super.key,
    this.cancellationPolicyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
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
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Black Widow ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular3x,
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
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'JCGV : Junction City ',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w400,
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

                /// Spacer
                const SizedBox(
                  height: kMargin30,
                ),

                /// Details
                const DateTimeLocationWithIconsView(),

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

                /// Seat Number
                const Row(
                  children: [
                    Text(
                      'Gold-G8,G7',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '20000Ks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                const FoodAndBeverageView()
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      'Convenience Fee',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    /// Spacer
                    SizedBox(
                      width: kMarginMedium,
                    ),

                    /// Icon
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),

                    /// Spacer
                    Spacer(),

                    /// Total Price
                    Text(
                      '500Ks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),

                GestureDetector(
                  onTap: (){
                    ticketCancellationPolicy(context);
                  },
                  child: Container(
                    // height: 28,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMargin10, vertical: kMarginSmall),
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    decoration: ShapeDecoration(
                      color: (cancellationPolicyColor) != null ? cancellationPolicyColor : kTicketCancellationButtonColor,
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
                const Row(
                  children: [
                    Text(
                      'Total',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kTextRegular3x,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '22500Ks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                    /// Text
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
                    const SizedBox(
                      height: kMarginMedium2,
                    ),
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
                    const SizedBox(
                      height: kMarginMedium1,
                    ),
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
                    const SizedBox(
                      height: kMarginMedium1,
                    ),
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

                    /// Policy
                    const Text(
                      '1. Refund not available for Convenience fees,Vouchers, Gift Cards, Taxes etc.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: kMarginCardMedium2,
                    ),
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
                      onTap: (){
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
              )
          );
        });
  }
}

/// Food And Beverage
class FoodAndBeverageView extends StatefulWidget {
  const FoodAndBeverageView({super.key});

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
              const Text(
                '2000Ks',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular2x,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: isShowItems,
          child: Column(
            children: [
              /// Spacer
              const SizedBox(
                height: kMargin10 + kMarginMedium,
              ),

              Row(
                children: [
                  /// Cross icon
                  Image.asset(
                    kCrossIcon,
                    width: kTextRegular4x,
                    height: kTextRegular4x,
                  ),

                  /// Spacer
                  const SizedBox(
                    width: kMarginSmall,
                  ),

                  /// Item
                  const Text(
                    'Potato Chips (Qt. 1)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kUnSelectedColor,
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  /// Spacer
                  const Spacer(),

                  /// Price
                  const Text(
                    '1000Ks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kUnSelectedColor,
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              /// Spacer
              const SizedBox(
                height: kMarginCardMedium2,
              ),

              Row(
                children: [
                  /// Cross icon
                  Image.asset(
                    kCrossIcon,
                    width: kTextRegular4x,
                    height: kTextRegular4x,
                  ),

                  /// Spacer
                  const SizedBox(
                    width: kMarginSmall,
                  ),

                  /// Item
                  const Text(
                    'Coca Cola Large (Qt. 1)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kUnSelectedColor,
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  /// Spacer
                  const Spacer(),

                  /// Price
                  const Text(
                    '1000Ks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kUnSelectedColor,
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

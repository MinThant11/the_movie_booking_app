import 'package:flutter/material.dart';

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
            Color(0xFF444444),
            Color(0xFF222222),
            Color(0xFF444444)
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
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.33,
                        ),
                      ),
                      TextSpan(
                        text: '(3D) (U/A)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                /// Spacer
                const SizedBox(
                  height: 8,
                ),

                /// Cinema
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'JCGV : Junction City ',
                        style: TextStyle(
                          color: Color(0xFF00FF6A),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '(SCREEN 2)',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                /// Spacer
                const SizedBox(
                  height: 30,
                ),

                /// Details
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sat, 18 Jun, 2022',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '3:30PM',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Q5H3+JPP, Corner \nof, Bogyoke Lann, \nYangon',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                /// Spacer
                const SizedBox(
                  height: 16,
                ),

                /// M-Tickets
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'M-Ticket ( ',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '2',
                        style: TextStyle(
                          color: Color(0xFF00FF6A),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' )',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                /// Spacer
                const SizedBox(
                  height: 16,
                ),

                /// Seat
                const Row(
                  children: [
                    Text(
                      'Gold-G8,G7',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '20000Ks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),

                /// Spacer
                const SizedBox(
                  height: 8,
                ),

                /// Divider
                const Divider(
                  color: kBottomNavigationUnSelectedColor,
                ),

                /// Spacer
                const SizedBox(
                  height: 8,
                ),

                /// Food And Beverage
                const FoodAndBeverageView()
              ],
            ),
          ),

          /// Ticket Divider
          Stack(
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '- - - - - - - - - - - - - - - - - - - - - - - - - -',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kLoginPageDividerColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 2,
                    ),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  kTicketStart,
                  height: 30,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  kTicketEnd,
                  height: 30,
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(24),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    /// Spacer
                    SizedBox(
                      width: 8,
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
                        fontSize: 16,
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
                    height: 28,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    decoration: ShapeDecoration(
                      color: (cancellationPolicyColor) != null ? cancellationPolicyColor : const Color(0xFFFF6B00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Ticket Cancellation policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(
                  color: kBottomNavigationUnSelectedColor,
                ),

                /// Spacer
                const SizedBox(
                  height: 8,
                ),

                const Row(
                  children: [
                    Text(
                      'Total',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF00FF6A),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '22500Ks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF00FF6A),
                        fontSize: 18,
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
                width: 320,
                height: 464,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(width: 1, color: Color(0xFF00FF6A)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Ticket Cancellation Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Online Food icon
                        Image.asset(
                          kOnlineFoodIcon,
                          width: 20,
                          height: 20,
                        ),

                        /// Spacer
                        const SizedBox(
                          width: 8,
                        ),

                        /// Text
                        const Text(
                          '100% Refund on F&B',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Ticket icon
                        Image.asset(
                          kTicketIcon,
                          width: 20,
                          height: 20,
                        ),

                        /// Spacer
                        const SizedBox(
                          width: 8,
                        ),

                        /// Text
                        const Text(
                          'Up to 75% Refund for Tickets',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Spacer
                        SizedBox(
                          width: 28,
                        ),

                        /// Text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '-75% refund until 2 hours before \nshow start time',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(
                              height: 8,
                            ),

                            Text(
                              '-50% refund between 2 hours and \n20 minutes before show start time',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 36,
                    ),

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
                      height: 12,
                    ),

                    const Text(
                      '2. No cancellation within 20minute of show start time.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(
                      height: 36,
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 283,
                        height: 39,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Close',
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16,
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
                width: 20,
                height: 20,
              ),

              /// Spacer
              const SizedBox(
                width: 4,
              ),

              /// Title
              const Text(
                'Food and Beverage',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              /// Spacer
              const SizedBox(
                width: 8,
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
                  fontSize: 16,
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
                height: 18,
              ),

              Row(
                children: [
                  /// Cross icon
                  Image.asset(
                    kCrossIcon,
                    width: 20,
                    height: 20,
                  ),

                  /// Spacer
                  const SizedBox(
                    width: 4,
                  ),

                  /// Item
                  const Text(
                    'Potatoe Chips (Qt. 1)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 14,
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
                      color: Color(0xFF888888),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              /// Spacer
              const SizedBox(
                height: 12,
              ),

              Row(
                children: [
                  /// Cross icon
                  Image.asset(
                    kCrossIcon,
                    width: 20,
                    height: 20,
                  ),

                  /// Spacer
                  const SizedBox(
                    width: 4,
                  ),

                  /// Item
                  const Text(
                    'Cocala Large(Qt. 1)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 14,
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
                      color: Color(0xFF888888),
                      fontSize: 14,
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

import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation_page.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../utils/colors.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

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
                'Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Input View
            const Padding(
              padding: EdgeInsets.all(20),
              child: InputView(),
            ),
        
            /// Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        kPercentIcon,
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Unlock Offer or Apply Promo-code',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  )),
            ),
        
            /// Payment Type
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
              child: PaymentTypeView(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Input
class InputView extends StatelessWidget {
  const InputView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Your Name',
                  hintText: "Enter your name",
                  hintStyle: const TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                // controller: _controller,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '*',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFF0000),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentItems {
  String paymentIcon = "";
  String paymentName = "";

  PaymentItems(this.paymentIcon, this.paymentName);
}

class PaymentTypeView extends StatelessWidget {
  PaymentTypeView({super.key});

  final List<PaymentItems> paymentItems = [
    PaymentItems(kUPI, "UPI"),
    PaymentItems(kGiftVoucher, "Gift Voucher"),
    PaymentItems(kQuickPay, "Quick Pay"),
    PaymentItems(kCreditDebitCard, "Credit Card / Debit Card"),
    PaymentItems(kRedeemPoint, "Redeem Point"),
    PaymentItems(kMobileWallet, "Mobile Wallet"),
    PaymentItems(kNetBanking, "Net Banking"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose your payment type',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 3),
        ),
        Column(
          children: paymentItems.map((paymentItem) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TicketConfirmationPage(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3FFFFFFF),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /// Payment Icon
                    Image.asset(
                      paymentItem.paymentIcon,
                      width: 22,
                      height: 22,
                    ),

                    /// Spacer
                    const SizedBox(
                      width: 10,
                    ),

                    /// Payment Name
                    Text(
                      paymentItem.paymentName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    /// Spacer
                    const Spacer(),

                    /// Forward Icon
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

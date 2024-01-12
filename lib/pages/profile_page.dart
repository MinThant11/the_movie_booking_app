import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/log_in_page.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../utils/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    kCoverPhoto,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          kProfilePhoto,
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage()),);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 36, vertical: 8),
                            decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.1),
                                border:
                                    Border.all(width: 1, color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              'Login or Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ProfileFeatureView()
          ],
        ),
      ),
    );
  }
}

class FeatureLists {
  String featureIcon = "";
  String featureLabel = "";

  FeatureLists(this.featureIcon, this.featureLabel);
}

class ProfileFeatureView extends StatelessWidget {
  ProfileFeatureView({
    super.key,
  });

  final List<FeatureLists> features = [
    FeatureLists(kPurchaseHistory, "Purchase History"),
    FeatureLists(kPercentIcon, "Offer"),
    FeatureLists(kGiftCard, "Gift Card"),
    FeatureLists(kLocation, "Location"),
    FeatureLists(kPayment, "Payment"),
    FeatureLists(kHelpAndSupport, "Help and Support"),
    FeatureLists(kLogout, "Logout"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: features.map((feature) {
        return InkWell(
          onTap: (){
            
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: (feature.featureLabel != "Logout")
                      ? Colors.white.withOpacity(0.1)
                      : kBackgroundColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                /// Payment Icon
                Image.asset(
                  feature.featureIcon,
                  color: Colors.white,
                  width: 24,
                  height: 24,
                ),

                /// Spacer
                const SizedBox(
                  width: 10,
                ),

                /// Payment Name
                Text(
                  feature.featureLabel,
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
                  color: kLoginPageDividerColor,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

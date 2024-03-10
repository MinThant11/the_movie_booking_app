import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import 'location_page.dart';

class GetOtpPage extends StatelessWidget {
  final String? mobileNumber;
  const GetOtpPage({super.key, this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kMarginMedium, vertical: kMarginMedium),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.93,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Spacer
                    const SizedBox(
                      height: kMarginXXLarge,
                    ),

                    /// Logo
                    Image.asset(
                      kLogo,
                      width: kLogoWidth,
                      height: kLogoHeight,
                    ),

                    /// Spacer
                    const SizedBox(
                      height: kMargin56,
                    ),

                    /// Verify Text
                    const Text(
                      "We’ve sent OTP Code",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular5x,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    /// Spacer
                    const SizedBox(
                      height: kMarginMedium,
                    ),

                    const Text(
                      "Please enter 6-digit OTP code that\n sent to your phone number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kUnSelectedColor,
                        fontSize: kTextRegular,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(
                      height: kMargin64,
                    ),

                    /// PINPut And Confirm OTP
                    PinPutAndConfirmOTP(mobileNumber: mobileNumber,),

                  ],
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "By clicking, I accept the Terms & Conditions & Privacy Policy",
                    style: TextStyle(
                      color: Color(0xFF4A4A4B),
                      fontSize: kTextSmall,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
        
                /// App Bar
                Row(
                  children: [
                    /// Back Icon
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: kMarginXLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PinPutAndConfirmOTP extends StatefulWidget {
  final String? mobileNumber;
  const PinPutAndConfirmOTP({super.key, this.mobileNumber});

  @override
  State<PinPutAndConfirmOTP> createState() => _PinPutAndConfirmOTPState();
}

class _PinPutAndConfirmOTPState extends State<PinPutAndConfirmOTP> {

  /// Model
  final TmbaModel _model = TmbaModel();

  /// State
  String? inputOTP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Input Code
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter OTP Code",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(0xFF7A7D7F),
                  fontSize: kTextRegular,
                  fontWeight: FontWeight.w400,
                  height: 2
              ),
            ),
            Pinput(
              length: 6,
              defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
              ),
              // validator: (value) {
              //   return value == "123456" ? null : "Wrong Otp!";
              // },
              onChanged: (value) {
                inputOTP = value;
              },
            )
          ],
        ),

        /// Spacer
        const SizedBox(
          height: kMargin30,
        ),

        /// Resend Code
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Don’t receive OTP? ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Resend Code",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kTextRegular,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        /// Spacer
        const SizedBox(
          height: kMargin30,
        ),

        /// Confirm OTP
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kMarginMedium3),
          child: SizedBox(
            width: double.infinity,
            height: 49,
            child: ElevatedButton(
              onPressed: () {
                if (inputOTP == "123456") {
                  debugPrint("phone : ${widget.mobileNumber}");
                  debugPrint("OTP : $inputOTP");

                  /// Sign In With Phone
                  _model.signInWithPhone( widget.mobileNumber ?? '', inputOTP ?? '').then((data) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationPage()));
                    return data;
                  });
                } else {
                  return;
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text(
                "Confirm OTP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: kTextRegular2x,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
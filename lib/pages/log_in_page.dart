import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/get_otp_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: kMarginMedium),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.93,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kMarginLarge,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Spacer
                      const SizedBox(
                        height: kMarginXLarge,
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
                        "Verify Your Phone Number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular5x,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
        
                      /// Spacer
                      const SizedBox(
                        height: kMarginMedium,
                      ),
        
                      const Text(
                        "We will send 6-digit sms code to \nverify your phone number",
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
        
                      /// Input
                      const Stack(
                        children: [
                          /// Country Code
                          Positioned(
                            left: 0,
                            top: -4,
                            child: Text(
                              "Country Code",
                              style: TextStyle(
                                color: kUnSelectedColor,
                                fontSize: kTextSmall,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
        
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CountryCodeView(),
                          ),
        
                          /// Input
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 250,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  hintText: "Mobile Number",
                                  hintStyle: TextStyle(
                                    color: kUnSelectedColor,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: kTextRegular2x,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
        
                      const SizedBox(
                        height: kMargin34,
                      ),
        
                      /// Normal LogIn
                      SizedBox(
                        width: double.infinity,
                        height: 49,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GetOtpPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            "Verify Your Phone Number",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: kTextRegular2x,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
        
                      const SizedBox(
                        height: kMargin30,
                      ),
        
                      /// Divider
                      Stack(
                        children: [
                          const Divider(
                            color: kLoginPageDividerColor,
                          ),
                          Positioned(
                            top: -5,
                            left: MediaQuery.of(context).size.width * 0.37,
                            child: Container(
                              width: 56,
                              decoration: const BoxDecoration(
                                color: kBackgroundColor,
                              ),
                              child: const Text(
                                'or',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  backgroundColor: kBackgroundColor,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
        
                      const SizedBox(
                        height: kMargin30,
                      ),
        
                      /// Google LogIn
                      SizedBox(
                        width: double.infinity,
                        height: 49,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GetOtpPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                kGoogleLogo,
                                width: kGoogleLogoSize,
                                height: kGoogleLogoSize,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: kMarginCardMedium2,
                              ),
                              const Text(
                                "Continue With Google",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: kTextRegular2x,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Country Code
class CountryCodeView extends StatefulWidget {
  const CountryCodeView({super.key});

  @override
  State<CountryCodeView> createState() => _CountryCodeViewState();
}

class _CountryCodeViewState extends State<CountryCodeView> {
  var countryCodes = ["+95", "+81", "+977", "+968", "+92", "+970", "+63"];
  var selectedCode = "";
  @override
  void initState() {
    super.initState();
    selectedCode = countryCodes.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      child: DropdownButton(
        value: selectedCode,
        style: const TextStyle(
          color: Colors.white,
          fontSize: kTextRegular2x,
        ),
        dropdownColor: kBackgroundColor,
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        isExpanded: true,
        itemHeight: 55.7,
        menuMaxHeight: kMovieDetailsTopImageHeight,
        items: countryCodes
            .map((code) => DropdownMenuItem(value: code, child: Text(code)))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCode = value ?? "";
          });
        },
      ),
    );
  }
}

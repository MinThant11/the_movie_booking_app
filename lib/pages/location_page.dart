import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../utils/dimens.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kMarginMedium2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Image.asset(
                      kPickRegion,
                      width: double.infinity,
                      height: 70,
                    ),
                    const SizedBox(
                      height: kMarginMedium2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMarginMedium3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                  begin: Alignment(-1.00, 0.03),
                                  end: Alignment(1, -0.03),
                                  colors: [
                                    Color(0xCC666666),
                                    Color(0x66555555),
                                    Color(0x66555555)
                                  ],
                                ),
                              ),
                              child: Center(
                                child: TextField(
                                  style: const TextStyle(
                                    color: Color(0xFF9E9E9E),
                                    fontWeight: FontWeight.w400,
                                    fontSize: kTextRegular,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Search your location",
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF9E9E9E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: kTextRegular,
                                    ),
                                    prefixIcon: Image.asset(
                                      kSearchIcon,
                                    ),
                                    prefixIconColor: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: kMarginMedium3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()),
                              );
                            },
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(kMarginMedium),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                kLocationArrowIcon,
                                color: const Color(0xFF3B3B3B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kMargin30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          kCity,
                          width: 90,
                          height: 50,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      color: kCitiesLabelBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 11),
                      child: const Text(
                        'Cities',
                        style: TextStyle(
                          color: Color(0xFFF1F1F1),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.63,
                  child: CitiesListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CitiesListView extends StatelessWidget {
  CitiesListView({super.key});

  final List<String> cityList = [
    "Yangon",
    "Mandalay",
    "Naypyidaw",
    "Bago",
    "Mawlamyine",
  ];

  @override
  Widget build(BuildContext context) {
    /// List View Builder
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
          child: Container(
            width: double.infinity,
            height: kMargin60,
            padding: const EdgeInsets.only(left: 23, top: 19),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kCitiesLabelBackgroundColor,
                ),
              ),
            ),
            child: Text(
              cityList[index],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: kTextRegular2x,
              ),
            ),
          ),
        );
      },
      itemCount: cityList.length,
    );
  }
}

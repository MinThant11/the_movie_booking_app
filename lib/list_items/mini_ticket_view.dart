import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class MiniTicketView extends StatelessWidget {
  const MiniTicketView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF616161),
                Color(0x00262626),
                Color(0x72272727),
                Color(0xFF333333),
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
                      Image.network(
                        "https://m.media-amazon.com/images/M/MV5BMzU3YTc1ZjMtZTAyOC00ZTI1LWE0MzItMTllN2M2YWI4MWZmXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_.jpg",
                        width: 96,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
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
                          const Text(
                            'JCGV : Junction City ',
                            style: TextStyle(
                              color: Color(0xFF00FF6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
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
                                    fontSize: 14,
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
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Gold-G8,G7',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
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
                        ],
                      ),
                    ],
                  )),

              /// Ticket Divider
              Stack(
                children: [
                  const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '- - - - - - - - - - - - - - - - - - - - - - - - - - - -',
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

              /// Details
              const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
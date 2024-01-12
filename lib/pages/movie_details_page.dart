import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/cast_item_view.dart';
import 'package:the_movie_booking_app/list_items/ticket_button_view.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../list_items/censor_rating_release_data_and_duration_view.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            /// Body
            const SingleChildScrollView(
              child: Column(
                children: [
                  /// Movie Large Image, Small Image and Info
                  MovieLargeImageSmallImageAndInfoView(),

                  SizedBox(
                    height: kMarginLarge,
                  ),

                  /// Censor Rating, Release Data and Duration
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
                    child: CensorRatingReleaseDataAndDurationView(),
                  ),

                  /// Spacer
                  SizedBox(
                    height: kMargin30,
                  ),

                  /// Story Line View
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Story Line",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: kTextRegular
                          ),
                        ),
                        SizedBox(
                          height: kMarginMedium,
                        ),
                        Text(
                          "In the 1970s, young Gru tries to join a group of supervillains called the Vicious 6 after they oust their leader -- the legendary fighter Wild Knuckles. When the interview turns disastrous, Gru and his Minions go on the run with the Vicious 6 hot on their tails. Luckily, he finds an unlikely source for guidance -- Wild Knuckles himself -- and soon discovers that even bad guys need a little help from their friends.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: kTextRegular
                          ),
                        )
                      ],
                    ),
                  ),

                  /// Spacer
                  SizedBox(
                    height: kMargin30,
                  ),

                  /// Cast View
                  CastView(),

                  SizedBox(
                    height: 148,
                  )
                ],
              ),
            ),

            /// App Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kMarginMedium,
                  vertical: kMarginMedium
              ),
              child: Row(
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

                  /// Spacer
                  const Spacer(),

                  /// Share Icon
                  const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: kMarginLarge,
                  ),
                ],
              ),
            ),

            /// Bottom Gradient and booking Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: kMovieDetailsBottomContainerHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, kBackgroundColor],
                  )
                ),
                child: const Center(
                  child: BookingButton(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieLargeImageSmallImageAndInfoView extends StatelessWidget {
  const MovieLargeImageSmallImageAndInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMovieDetailsTopSectionHeight,
      child: Stack(
        children: [
          /// Large Image and Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                "https://wallpapercave.com/wp/wp8815273.jpg",
                height: kMovieDetailsTopImageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(
                height: kMarginMedium2,
              ),

              /// Movie Info
              MovieInfoAndGenresView(),
            ],
          ),

          /// Small Image
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kMarginMedium2, bottom: kMarginMedium2),
              child: Image.network(
                "https://m.media-amazon.com/images/M/MV5BMzU3YTc1ZjMtZTAyOC00ZTI1LWE0MzItMTllN2M2YWI4MWZmXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_.jpg",
                width: kMovieDetailsSmallImageWidth,
                height: kMovieDetailsTopImageHeight,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MovieInfoAndGenresView extends StatelessWidget {
  MovieInfoAndGenresView({super.key});

  final List<String> genreList = ["Action", "Adventure", "Drama", "Animation"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      child: Padding(
        padding: const EdgeInsets.only(left: kMarginMedium2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Movie Name and Rating View
            const MovieNameAndRatingView(),

            /// Spacer
            const SizedBox(
              height: kMarginMedium2,
            ),

            /// Type
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "2D, 3D, 3D IMAX, 3D DBOX",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: kTextRegular2x,
                  ),
                ),
              ],
            ),

            /// Spacer
            const SizedBox(
              height: kMarginMedium2,
            ),

            /// Genres
            Wrap(
              spacing: kMarginMedium,
              runSpacing: kMarginMedium,
              children: genreList
                  .map(
                    (genre) => Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kMarginCardMedium2),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMarginMedium, vertical: kMarginSmall),
                      child: Text(
                        genre,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: kTextSmall,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class MovieNameAndRatingView extends StatelessWidget {
  const MovieNameAndRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Movie Name
        const Text(
          "Venom II",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: kTextRegular2x,
          ),
        ),

        const SizedBox(
          width: kMarginMedium,
        ),

        Image.asset(
          kImdbImage,
          width: kIMDBWidth,
          height: kIMDBHeight,
        ),

        const Text(
          "7.1",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular2x,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}

/// Cast View
class CastView extends StatelessWidget {
  const CastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Cast Label
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
          child: Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular,
            ),
          ),
        ),

        /// Spacer
        const SizedBox(
          height: kMarginMedium3,
        ),

        SizedBox(
          height: kMargin60,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CastItemView();
          }, itemCount: 10,),
        )
      ],
    );
  }
}

/// Booking Button
class BookingButton extends StatelessWidget {
  const BookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseTimeAndCinemaPage()));
      },
      child: const SizedBox(
        height: kBookingButtonHeight,
        child: TicketButtonView(buttonName: 'Booking',),
      ),
    );
  }
}


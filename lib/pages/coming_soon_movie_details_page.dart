import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../list_items/cast_item_view.dart';
import '../list_items/censor_rating_release_data_and_duration_view.dart';
import '../utils/images.dart';

class ComingSoonMovieDetailsPage extends StatelessWidget {
  const ComingSoonMovieDetailsPage({super.key});

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
                  /// Coming Soon Movie Large Image, Small Image And Info
                  ComingSoonMovieLargeImageSmallImageAndInfoView(),

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

                  /// Releasing Date
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
                    child: ReleasingDateView(),
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
                              fontSize: kTextRegular),
                        ),
                        SizedBox(
                          height: kMarginMedium,
                        ),
                        Text(
                          "In the 1970s, young Gru tries to join a group of supervision "
                          "called the Vicious 6 after they oust their leader -- the "
                          "legendary fighter Wild Knuckles. When the interview turns "
                          "disastrous, Gru and his Minions go on the run with the Vicious 6 "
                          "hot on their tails. Luckily, he finds an unlikely source for guidance --"
                          " Wild Knuckles himself -- and soon discovers that even bad guys need a "
                          "little help from their friends.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: kTextRegular),
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

                  /// Spacer
                  SizedBox(
                    height: kMargin30,
                  ),
                ],
              ),
            ),

            /// App Bar
            Padding(
              padding: const EdgeInsets.all(kMarginMedium),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Coming Soon Movie Large Image, Small Image And Info
class ComingSoonMovieLargeImageSmallImageAndInfoView extends StatelessWidget {
  const ComingSoonMovieLargeImageSmallImageAndInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMovieDetailsTopSectionHeight,
      child: Stack(
        children: [
          /// Large Image And Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Large Image
              Image.network(
                "https://wallpapercave.com/wp/wp8815273.jpg",
                width: double.infinity,
                height: kMovieDetailsTopImageHeight,
                fit: BoxFit.cover,
              ),

              /// Spacer
              const SizedBox(
                height: kMarginMedium2,
              ),

              /// Coming Soon Movie Info
              ComingSoonMovieInfoAndGenresView(),
            ],
          ),

          /// Small Image
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kMarginMedium2, vertical: kMarginMedium2),
              child: Image.network(
                "https://m.media-amazon.com/images/M/MV5BMzU3YTc1ZjMtZTAyOC00ZTI1LWE0MzItMTllN2M2YWI4MWZmXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_.jpg",
                width: kMovieDetailsSmallImageWidth,
                height: kMovieDetailsTopImageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Coming Soon Movie Info And Genres
class ComingSoonMovieInfoAndGenresView extends StatelessWidget {
  ComingSoonMovieInfoAndGenresView({super.key});

  final List<String> genreList = ["Action", "Adventure", "Drama", "Animation"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      child: Padding(
        padding: const EdgeInsets.only(left: kMarginMedium3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Coming Soon Movie Name And Rating
            const ComingSoonMovieNameAndRatingView(),

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
                  .map((genres) => Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius:
                              BorderRadius.circular(kMarginCardMedium2),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kMarginMedium, vertical: kMarginSmall),
                        child: Text(
                          genres,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: kTextSmall,
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

/// Coming Soon Movie Name And Rating
class ComingSoonMovieNameAndRatingView extends StatelessWidget {
  const ComingSoonMovieNameAndRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Coming Soon Movie Name
        const Text(
          "Venom II",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular2x,
            fontWeight: FontWeight.bold,
          ),
        ),

        /// Spacer
        const SizedBox(
          width: kMarginMedium,
        ),

        /// IMDB
        Image.asset(
          kImdbImage,
          width: kIMDBWidth,
          height: kIMDBHeight,
        ),

        /// Rating
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

/// Releasing Date
class ReleasingDateView extends StatelessWidget {
  const ReleasingDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 154,
        padding: const EdgeInsets.only(top: 14, right: 8, bottom: 12, left: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF434343), Color(0xFF7A7A7A)]),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                kReadingMessage,
                width: 110,
                height: 128,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 222,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Releasing in 5 days",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Get notify as soon as movie booking opens up in your city!",
                    style: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: kTextRegular,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              child: Container(
                  width: 160,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Image.asset(
                        kSetNotificationIcon,
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Set Notification",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: kTextRegular
                        ),
                      )
                    ],
                  )
              ),
            )
          ],
        ));
  }
}

/// Cast
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
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

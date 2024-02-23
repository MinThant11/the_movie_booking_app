import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/vos/movie_vo.dart';

class MovieListItemView extends StatelessWidget {
  final bool isComingSoonSelected;
  final MovieVO movie;

  const MovieListItemView({super.key, required this.isComingSoonSelected, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(kMarginMedium),
      ),
      child: Column(
        children: [
          /// Movie Image and Gradient
          Stack(
            children: [
              /// Movie Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(kMarginMedium),
                  topRight: Radius.circular(kMarginMedium),
                ),
                child: Image.network(
                  movie.getPosterPathWithBaseUrl(),
                  fit: BoxFit.cover,
                  height: kMovieListItemImageHeight,
                  width: double.infinity,
                ),
              ),

              /// Gradient
              Container(
                height: kMovieListItemImageHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black
                      ],
                      stops: [
                        0.0,
                        0.7,
                        1.0
                      ]),
                ),
              ),

              /// Indicator
              Align(
                alignment: Alignment.topRight,
                child: Visibility(
                  visible: isComingSoonSelected,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: kMarginMedium, right: kMarginMedium),
                    child: Container(
                      width: kMarginXLarge,
                      height: kMarginXLarge,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kMarginMedium),
                      ),
                      child: const Center(
                        child: Text(
                          "8th\nAUG",
                          style: TextStyle(
                            color: kNowPlayingAndComingSoonUnSelectedTextColor,
                            fontSize: kTextXSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          /// Movie Name and IMDB View
          MovieNameAndIMDBView(
            movie: movie,
          ),

          /// Spacer
          const SizedBox(
            height: kMarginCardMedium2,
          ),

          /// Additional Info View
          const AdditionalInfoView(),
        ],
      ),
    );
  }
}

/// Movie Name And Imdb View
class MovieNameAndIMDBView extends StatelessWidget {
  final MovieVO movie;
  const MovieNameAndIMDBView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
      child: Row(
        children: [
          /// Name
          Expanded(
            child: Text(
              movie.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: kTextSmall,
              ),
            ),
          ),

          /// Spacer
          const Spacer(),

          /// IMDB
          Image.asset(
            kImdbImage,
            width: kMarginLarge,
            height: kMarginMedium3,
          ),

          /// Rating
          Text(
            movie.getRatingTwoDecimals(),
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: kTextSmall,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

/// Additional Info View
class AdditionalInfoView extends StatelessWidget {
  const AdditionalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
      child: Row(
        children: [
          /// Restriction
          const Text(
            "U/A",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// spacer
          const SizedBox(
            width: kMarginMedium,
          ),

          /// Circle
          Container(
            width: kMargin5,
            height: kMargin5,
            decoration: const BoxDecoration(
              color: kCircleColor,
              shape: BoxShape.circle,
            ),
          ),

          /// spacer
          const SizedBox(
            width: kMarginMedium,
          ),

          /// Type
          const Text(
            "2D, 3D, 3D, IMAX",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
            ),
          )
        ],
      ),
    );
  }
}

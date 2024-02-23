import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';

/// Censor Rating Release Data And Duration View
class CensorRatingReleaseDataAndDurationView extends StatelessWidget {
  final MovieVO? movie;
  const CensorRatingReleaseDataAndDurationView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CensorRatingReleaseDataAndDurationItemView(
          label: "Censor Rating",
          value: "U/A",
        ),
        CensorRatingReleaseDataAndDurationItemView(
          label: "Release Date",
          value: movie?.getReleaseDateFormatted() ?? "",
        ),
        CensorRatingReleaseDataAndDurationItemView(
          label: "Duration",
          value: movie?.getRunTimeFormatted() ?? "",
        ),
      ],
    );
  }
}

/// Censor Rating Release Data And Duration Item View
class CensorRatingReleaseDataAndDurationItemView extends StatelessWidget {
  final String label;
  final String value;

  const CensorRatingReleaseDataAndDurationItemView(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginMedium2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginCardMedium2),
          gradient: const LinearGradient(colors: [
            kMovieDetailsCensorRatingGradientStartColor,
            kMovieDetailsCensorRatingGradientEndColor,
          ])),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextSmall,
            ),
          ),
          const SizedBox(
            height: kMarginMedium,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular,
            ),
          )
        ],
      ),
    );
  }
}

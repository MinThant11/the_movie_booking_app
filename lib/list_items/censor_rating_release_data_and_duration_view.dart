import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';

/// Censor Rating Release Data And Duration View
class CensorRatingReleaseDataAndDurationView extends StatelessWidget {

  const CensorRatingReleaseDataAndDurationView(
      {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CensorRatingReleaseDataAndDurationItemView(
          label: "Censor Rating",
          value: "U/A",
        ),
        CensorRatingReleaseDataAndDurationItemView(
          label: "Release Date",
          value: "May 8th,2022",
        ),
        CensorRatingReleaseDataAndDurationItemView(
          label: "Duration",
          value: "2hr 15min",
        ),
      ],
    );
  }
}

/// Censor Rating Release Data And Duration Item View
class CensorRatingReleaseDataAndDurationItemView extends StatelessWidget {

  final String label;
  final String value;

  const CensorRatingReleaseDataAndDurationItemView({
    super.key, required this.label, required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginMedium2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginCardMedium2),
          gradient: const LinearGradient(colors: [
            kMovieDetailsCensorRatingGradientStartColor,
            kMovieDetailsCensorRatingGradientEndColor
          ])
      ),
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
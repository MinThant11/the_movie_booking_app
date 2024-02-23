import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

class CastItemView extends StatelessWidget {
  final CreditVO? credit;
  const CastItemView({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: CachedNetworkImage(
            imageUrl: kImageBaseUrl + (credit?.profilePath ?? ""),
            imageBuilder: (context, image) => CircleAvatar(
              backgroundImage: image,
              maxRadius: 30,
            ),
            errorWidget: (_, __, ___) => Image.network(
              "https://media.istockphoto.com/id/1332100919/vector/man-icon-black-icon-person-symbol.jpg?s=612x612&w=0&k=20&c=AVVJkvxQQCuBhawHrUhDRTCeNQ3Jgt0K1tXjJsFy1eg=",
              width: kMargin60,
              height: kMargin60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: kMarginMedium2,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/models/movie_booking_model.dart';
import 'package:the_movie_booking_app/list_items/cast_item_view.dart';
import 'package:the_movie_booking_app/list_items/ticket_button_view.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';
import '../list_items/censor_rating_release_data_and_duration_view.dart';

class MovieDetailsPage extends StatefulWidget {
  final bool isComingSoonSelected;

  /// Will receive from previous screen
  final String? movieId;
  const MovieDetailsPage(
      {super.key, required this.isComingSoonSelected, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;

  @override
  void initState() {
    super.initState();
    
    /// Get Movie Details From Database
    _model.getMovieByIdFromDatabase(int.parse(widget.movieId ?? "0")).then((movie) {
      setState(() {
        movieDetails = movie;
      });
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(widget.movieId ?? "").then((movie) {
      setState(() {
        movieDetails = movie;
      });
    });

    /// Get Credits By Movie From Network
    _model.getCreditsByMovie(widget.movieId ?? "").then((credit) {
      setState(() {
        creditList = credit;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: (movieDetails == null)
            ? const CircularProgressIndicator(
                color: kBackgroundColor,
              )
            : Stack(
                children: [
                  /// Body
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Movie Large Image, Small Image and Info
                        MovieLargeImageSmallImageAndInfoView(
                          movie: movieDetails,
                        ),

                        /// Spacer
                        const SizedBox(
                          height: kMarginMedium2,
                        ),

                        /// Censor Rating, Release Data and Duration
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMarginMedium2),
                          child: CensorRatingReleaseDataAndDurationView(
                            movie: movieDetails,
                          ),
                        ),

                        /// Releasing Date
                        Visibility(
                          visible: widget.isComingSoonSelected,
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: kMarginMedium2,
                                right: kMarginMedium2,
                                top: kMargin30),
                            child: ReleasingDateView(),
                          ),
                        ),

                        /// Story Line View
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMarginMedium2, vertical: kMargin30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Story Line",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: kTextRegular),
                              ),
                              const SizedBox(
                                height: kMarginMedium,
                              ),
                              Text(
                                movieDetails?.overview ?? "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: kTextRegular),
                              )
                            ],
                          ),
                        ),

                        /// Cast View
                        Visibility(
                          visible: !(creditList?.isEmpty ?? true),
                          child: CastView(
                            creditList: creditList ?? [],
                          ),
                        ),

                        const SizedBox(
                          height: 148,
                        )
                      ],
                    ),
                  ),

                  /// App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMarginMedium, vertical: kMarginMedium),
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
                  Visibility(
                    visible: !widget.isComingSoonSelected,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: kMovieDetailsBottomContainerHeight,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, kBackgroundColor],
                        )),
                        child: const Center(
                          child: BookingButton(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

/// Movie Large Image, Small Image and Info
class MovieLargeImageSmallImageAndInfoView extends StatelessWidget {
  final MovieVO? movie;
  const MovieLargeImageSmallImageAndInfoView({super.key, required this.movie});

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
                movie?.getBackdropPathWithBaseUrl() ?? "",
                height: kMovieDetailsTopImageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(
                height: kMarginMedium2,
              ),

              /// Movie Info
              MovieInfoAndGenresView(
                movie: movie,
              ),
            ],
          ),

          /// Small Image
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kMarginMedium1, bottom: kMarginMedium2),
              child: Image.network(
                movie?.getPosterPathWithBaseUrl() ?? "",
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

/// Movie Info And Genres View
class MovieInfoAndGenresView extends StatelessWidget {
  final MovieVO? movie;
  const MovieInfoAndGenresView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      child: Padding(
        padding:
            const EdgeInsets.only(left: kMarginMedium2, right: kMarginMedium1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Movie Name and Rating View
            MovieNameAndRatingView(
              movie: movie,
            ),

            /// Spacer
            const SizedBox(
              height: kMarginMedium,
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
                    fontSize: kTextRegular,
                  ),
                ),
              ],
            ),

            /// Spacer
            const SizedBox(
              height: kMarginMedium1,
            ),

            /// Genres
            Wrap(
              spacing: kMarginMedium,
              runSpacing: kMarginMedium,
              children: movie?.genres
                      ?.take(5)
                      .map((genre) => genre.name ?? "")
                      .map(
                        (genre) => Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius:
                                BorderRadius.circular(kMarginCardMedium2),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMarginMedium,
                              vertical: kMarginSmall),
                          child: Text(
                            genre,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: kTextSmall,
                            ),
                          ),
                        ),
                      )
                      .toList() ??
                  [],
            )
          ],
        ),
      ),
    );
  }
}

/// Movie Name And Rating View
class MovieNameAndRatingView extends StatelessWidget {
  final MovieVO? movie;
  const MovieNameAndRatingView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Movie Name
        Expanded(
          child: Text(
            movie?.title ?? "",
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: kTextRegular2x,
            ),
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

        Text(
          movie?.getRatingTwoDecimals() ?? "",
          style: const TextStyle(
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
              top: kMargin90,
              child: Container(
                  width: kMovieDetailsSmallImageWidth,
                  height: kMargin34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMarginMedium),
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: kMarginMedium,
                      ),
                      Image.asset(
                        kSetNotificationIcon,
                        width: kMarginMedium4,
                        height: kMarginMedium4,
                      ),
                      const SizedBox(
                        width: kMarginMedium,
                      ),
                      const Text(
                        "Set Notification",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: kTextRegular),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}

/// Cast View
class CastView extends StatelessWidget {
  final List<CreditVO> creditList;
  const CastView({super.key, required this.creditList});

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

        /// Cast Item
        SizedBox(
          height: kMargin60,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CastItemView(
                credit: creditList[index],
              );
            },
            itemCount: creditList.length,
          ),
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ChooseTimeAndCinemaPage()));
      },
      child: const SizedBox(
        height: kBookingButtonHeight,
        child: TicketButtonView(
          buttonName: 'Booking',
        ),
      ),
    );
  }
}

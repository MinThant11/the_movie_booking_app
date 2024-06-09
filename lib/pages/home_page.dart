import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_movie_booking_app/data/models/movie_booking_model.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/list_items/movie_list_item_view.dart';
import 'package:the_movie_booking_app/pages/location_page.dart';
import 'package:the_movie_booking_app/pages/movie_details_page.dart';
import 'package:the_movie_booking_app/pages/search_moving_page.dart';
import 'package:the_movie_booking_app/scoped_model/home_model.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../data/vos/movie_vo.dart';

class HomePage extends StatefulWidget {
  final String? city;
  const HomePage({super.key, this.city});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Model
  final HomeModel _model = HomeModel();

  @override
  void dispose() {
    _model.onDisposed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
      model: _model,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor,
          surfaceTintColor: kBackgroundColor,
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocationPage()),
              );
            },
            child: Row(
              children: [
                const SizedBox(
                  width: kMarginMedium,
                ),
                Image.asset(
                  kLocationArrowIcon,
                  width: kLocationIconSize,
                  height: kLocationIconSize,
                ),
                const SizedBox(
                  width: kMarginMedium,
                ),
                Text(
                  widget.city ?? 'Yangon',
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    fontSize: kTextRegular,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            const SearchMovieIconView(),
            const SizedBox(
              width: kMarginXLarge,
            ),
            const Icon(
              Icons.notifications,
              color: Colors.white,
              size: kMarginLarge,
            ),
            const SizedBox(
              width: kMarginMedium2,
            ),
            Image.asset(
              kScanIcon,
            ),
            const SizedBox(
              width: kHomeScreenAppBarRightMargin,
            )
          ],
        ),
        body: const HomeScreenBodyView(),
      ),
    );
  }
}

class SearchMovieIconView extends StatefulWidget {
  const SearchMovieIconView({
    super.key,
  });

  @override
  State<SearchMovieIconView> createState() => _SearchMovieIconViewState();
}

class _SearchMovieIconViewState extends State<SearchMovieIconView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchMovingPage(),
            ),
          );
        });
      },
      child: const Icon(
        Icons.search,
        color: Colors.white,
        size: kMarginLarge,
      ),
    );
  }
}

class HomeScreenBodyView extends StatelessWidget {
  const HomeScreenBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Banner
        SliverToBoxAdapter(
          child: BannerSectionView(),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMarginLarge,
          ),
        ),

        /// Now Showing and Coming soon Tab Bar
        SliverToBoxAdapter(
          child: ScopedModelDescendant<HomeModel>(
            builder: (context, child, model) => NowShowingAndComingSoonTabBar(
              selectedText: model.selectedText,
              onTapNowShowingOrComingSoon: (text) {
                model.onTapNowShowingOrComingSoon(text);
              },
            ),
          ),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMarginLarge,
          ),
        ),

        /// Movie List GridView
        ScopedModelDescendant<HomeModel>(
          builder: (context, child, model) => (model.movieToShow.isEmpty)
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsPage(
                                  movieId:
                                      model.movieToShow[index].id?.toString() ??
                                          "",
                                  isComingSoonSelected:
                                      model.selectedText == kComingSoonLabel,
                                ),
                              ),
                            );
                          },
                          child: MovieListItemView(
                            isComingSoonSelected:
                                model.selectedText == kComingSoonLabel,
                            movie: model.movieToShow[index],
                          ),
                        );
                      },
                      childCount: model.movieToShow.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: kMovieListItemHeight,
                      mainAxisSpacing: kMarginMedium3,
                      crossAxisSpacing: kMarginMedium3,
                    ),
                  ),
                ),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMarginLarge,
          ),
        ),
      ],
    );
  }
}

/// Banner
class BannerSectionView extends StatelessWidget {
  BannerSectionView({super.key});

  final PageController _bannerPageController =
      PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Page View
        SizedBox(
          height: kBannerHeight,
          child: PageView.builder(
            controller: _bannerPageController,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: kMarginMedium),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kMarginMedium),
                  child: Image.asset(
                    kBannerImage,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),

        /// Spacer
        const SizedBox(
          height: kMarginMedium2,
        ),

        /// Data Indicator
        SmoothPageIndicator(
          controller: _bannerPageController,
          count: 5,
          effect: const SlideEffect(
              dotColor: kInactiveDotsColor,
              activeDotColor: kPrimaryColor,
              dotHeight: kMarginMedium,
              dotWidth: kMarginMedium),
          onDotClicked: (index) {
            _bannerPageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut);
          },
        )
      ],
    );
  }
}

/// Now Showing and Coming Soon Tab Bar
class NowShowingAndComingSoonTabBar extends StatelessWidget {
  final String? selectedText;
  final Function(String) onTapNowShowingOrComingSoon;

  const NowShowingAndComingSoonTabBar(
      {super.key,
      this.selectedText,
      required this.onTapNowShowingOrComingSoon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kNowPlayingAndComingSoonTabBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMargin5),
          gradient: const RadialGradient(colors: [
            kNowPlayingAndComingSoonGradientStartColor,
            kNowPlayingAndComingSoonGradientEndColor
          ], radius: 12.5, center: Alignment(0, -0.02))),
      child: Row(
        children: [
          /// Now Showing Button
          Expanded(
            child: NowShowingOrComingSoonButtonView(
              label: kNowShowingLabel,
              isSelected: selectedText == kNowShowingLabel,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kNowShowingLabel);
              },
            ),
          ),

          /// Coming Soon Button
          Expanded(
            child: NowShowingOrComingSoonButtonView(
              label: kComingSoonLabel,
              isSelected: selectedText == kComingSoonLabel,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kComingSoonLabel);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// bool nowShowingOrComingSoon() {
//   bool isNowShowing = false;
//   NowShowingAndComingSoonTabBar(
//     onTapNowShowingOrComingSoon: (text) {
//       isNowShowing = kComingSoonLabel == text;
//     },
//   );
//   return isNowShowing;
// }

class NowShowingOrComingSoonButtonView extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function onTapButton;

  const NowShowingOrComingSoonButtonView(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapButton();
      },
      child: Container(
        margin: const EdgeInsets.all(kMarginMedium),
        decoration: BoxDecoration(
            color: (isSelected) ? kPrimaryColor : null,
            borderRadius: BorderRadius.circular(kMarginSmall)),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (isSelected)
                  ? kNowPlayingAndComingSoonSelectedTextColor
                  : kNowPlayingAndComingSoonUnSelectedTextColor,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

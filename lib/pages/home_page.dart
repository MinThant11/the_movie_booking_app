import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_movie_booking_app/blocs/home_bloc.dart';
import 'package:the_movie_booking_app/list_items/movie_list_item_view.dart';
import 'package:the_movie_booking_app/pages/location_page.dart';
import 'package:the_movie_booking_app/pages/movie_details_page.dart';
import 'package:the_movie_booking_app/pages/search_moving_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../data/vos/movie_vo.dart';

class HomePage extends StatelessWidget {
  final String? city;
  const HomePage({super.key, this.city});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
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
                  city ?? 'Yangon',
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchMovingPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: kMarginLarge,
              ),
            ),
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
          child: Selector<HomeBloc, String>(
            selector: (context, bloc) => bloc.selectedText,
            builder: (context, selectedText, child) => NowShowingAndComingSoonTabBar(
              selectedText: selectedText,
              onTapNowShowingOrComingSoon: (text) {
                var bloc = context.read<HomeBloc>();
                bloc.onTapNowShowingOrComingSoon(text);
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
        Selector<HomeBloc, List<MovieVO>>(
          selector: (context, bloc) => bloc.movieToShow,
          builder: (context, movieToShow, child) {
            var bloc = context.read<HomeBloc>();
            return (movieToShow.isEmpty)
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
                              movieToShow[index].id?.toString() ??
                                  "",
                              isComingSoonSelected:
                              bloc.selectedText == kComingSoonLabel,
                            ),
                          ),
                        );
                      },
                      child: MovieListItemView(
                        isComingSoonSelected:
                        bloc.selectedText == kComingSoonLabel,
                        movie: movieToShow[index],
                      ),
                    );
                  },
                  childCount: movieToShow.length,
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: kMovieListItemHeight,
                  mainAxisSpacing: kMarginMedium3,
                  crossAxisSpacing: kMarginMedium3,
                ),
              ),
            );
          }
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

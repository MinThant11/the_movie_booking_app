import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/blocs/search_movie_bloc.dart';
import 'package:the_movie_booking_app/list_items/movie_list_item_view.dart';
import 'package:the_movie_booking_app/pages/movie_details_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';

import '../utils/dimens.dart';
import '../utils/images.dart';

class SearchMovingPage extends StatefulWidget {
  const SearchMovingPage({super.key});

  @override
  State<SearchMovingPage> createState() => _SearchMovingPageState();
}

class _SearchMovingPageState extends State<SearchMovingPage>  {
  final SearchMovieBloc _searchMovieBloc = SearchMovieBloc();

  @override
  void dispose() {
    _searchMovieBloc.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// App Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  /// Back
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),

                  /// Spacer
                  const SizedBox(
                    width: 8,
                  ),

                  // /// Search
                  // const Icon(
                  //   Icons.search,
                  //   color: Colors.white,
                  // ),
                  //
                  // /// Spacer
                  // const SizedBox(
                  //   width: 14,
                  // ),

                  /// Input - Text Field
                  SizedBox(
                    width: 270,
                    child: TextField(
                      onChanged: (query) {
                        _searchMovieBloc.queryStreamController.sink.add(query);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search the movie",
                        hintStyle: TextStyle(
                          color: Color(0xFF444444),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      // controller: _controller,
                    ),
                  ),

                  // /// Spacer
                  // const Spacer(),
                  //
                  // /// Filter
                  // Image.asset(
                  //   kFilterIcon,
                  //   color: kPrimaryColor,
                  //   width: 17,
                  //   height: 17,
                  // ),

                  // /// Spacer
                  // const SizedBox(
                  //   width: 14,
                  // ),
                ],
              ),
            ),

            /// Drop Down
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: DropDownView(),
            // ),

            /// Movie View
            Expanded(
              child: StreamBuilder(
                  stream: _searchMovieBloc.movieStreamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: kMovieListItemHeight,
                          mainAxisSpacing: kMarginMedium3,
                          crossAxisSpacing: kMarginMedium3,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailsPage(
                                          isComingSoonSelected: false,
                                          movieId: snapshot.data![index].id?.toString() ?? "",
                                      )));
                            },
                            child: MovieListItemView(
                              isComingSoonSelected: false,
                              movie: snapshot.data![index],
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Drop Down View
class DropDownView extends StatelessWidget {
  const DropDownView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: kMarginMedium2, runSpacing: kMarginMedium, children: [
      Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: kMarginMedium, vertical: kMarginSmall),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Genres',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),

              /// Spacer
              SizedBox(
                width: 8,
              ),

              /// Search
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
                size: 14,
              ),
            ],
          )),
      Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: kMarginMedium, vertical: kMarginSmall),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Format',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),

              /// Spacer
              SizedBox(
                width: 8,
              ),

              /// Search
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
                size: 14,
              ),
            ],
          )),
    ]);
  }
}

/// TODO: Filter
// class FilterMovieView extends StatelessWidget {
//   const FilterMovieView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisExtent: kMovieListItemHeight,
//         mainAxisSpacing: kMarginMedium3,
//         crossAxisSpacing: kMarginMedium3,
//       ),
//       itemCount: 1,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {},
//           child: MovieListItemView(
//             isComingSoonSelected: nowShowingOrComingSoon(),
//             movie: null,
//           )
//         );
//       },
//     );
//   }
// }

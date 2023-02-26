import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/pages/search/widgets/search_title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(searchTitle: 'Movise & TV'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.4 / 2,
                children: List.generate(state.searchResultList.length, (index) {
                  final movie = state.searchResultList[index];

                  return MainCard(
                    imageUrl: movie.postePathImageUrl,
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:go_router/go_router.dart';

class MoviesHorizontalListView extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListView({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  State<MoviesHorizontalListView> createState() => _MoviesHorizontalListViewState();
}

class _MoviesHorizontalListViewState extends State<MoviesHorizontalListView> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;

      if(scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent){
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if(widget.title!=null || widget.subtitle!=null)
            _Title(title: widget.title, subtitle: widget.subtitle),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FadeInRight(child: _Slide(movie: widget.movies[index])),
            )
          )
        ],

      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;
  
  const _Slide({required this.movie,});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0), 
                      child: Center(child: CircularProgressIndicator(strokeWidth: 2,)));
                  }
                  return GestureDetector(
                    onTap: () => context.push('/home/0/movie/${movie.id}'),
                    child: FadeIn(child: child)
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),

          MovieRating(voteAverage: movie.voteAverage, popularity: movie.popularity),
        ],
      )
    );
  }
}



class _Title extends StatelessWidget {

  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        children: [
          if(title != null)
            Text(title!, style: titleStyle,),

          const Spacer(),

          if(subtitle!=null)
            FilledButton.tonal(
              onPressed: (){}, 
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(subtitle!)),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  final movieRepository = ref.watch(moviesRepositoryProvider);
  return movieRepository.getSimilarMovies(movieId);
});

class SimilarMovies extends ConsumerWidget {

  final int movieId;

  const SimilarMovies({
    super.key, 
    required this.movieId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    return similarMoviesFuture.when(
      data: (movies) => Container(
        margin: const EdgeInsetsDirectional.only(bottom: 50),
        child: MoviesHorizontalListView(
          title: 'Similar Movies',
          movies: movies
        ),
      ), 
      error: (_, __) => const Center(child: Text('Not possible to load similar movies.'),), 
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2,),),
    );
  }
}
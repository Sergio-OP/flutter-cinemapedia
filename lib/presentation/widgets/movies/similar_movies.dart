import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

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
    return FutureBuilder(
      future: ref.read(moviesRepositoryProvider).getSimilarMovies(movieId), 
      builder: (context, snapshot) {
        return const Placeholder();
      },
    );
  }
}
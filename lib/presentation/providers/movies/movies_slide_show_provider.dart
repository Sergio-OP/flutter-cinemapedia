import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final moviesSlideShow = ref.watch(nowPlayingMoviesProvider);
  if (moviesSlideShow.isEmpty) return [];
  return moviesSlideShow.sublist(0,6); 
},);
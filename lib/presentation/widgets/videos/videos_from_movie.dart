import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/entities.dart';

final FutureProviderFamily<List<Video>, int> videosFromMovieProvider = FutureProvider.family((ref, int movieId) {
 final moviesRepository = ref.watch(moviesRepositoryProvider);
 return moviesRepository.getYoutubeVideosById(movieId);
});

class VideosFromMovie extends ConsumerWidget {

  final int movieId;

  const VideosFromMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final videosFromMovie = ref.watch(videosFromMovieProvider(movieId));

    return videosFromMovie.when(
      data: (videos) => Container(
        color: Colors.red,
        margin: const EdgeInsets.only(bottom: 50),
        child: SizedBox(
          height: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: videos.map((video) => Text(video.name)).toList(),
          ),
        ),
      ), 
      error: (_, __) => const Center(child: Text('Not possible to load similar movies'),), 
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2,),),);
  }
}
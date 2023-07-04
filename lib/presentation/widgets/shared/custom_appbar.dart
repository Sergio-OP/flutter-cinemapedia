import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary,),
              const SizedBox(width: 5.0),
              Text('Cinemapedia', style: titleStyle,),
              const Spacer(),
              IconButton(
                onPressed: (){
                  final moviesRepository = ref.read(moviesRepositoryProvider);
                  showSearch(
                    context: context, 
                    delegate: SearchMovieDelegate(moviesRepository.searchMovies)
                  );
                }, 
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      )
      );
  }
}
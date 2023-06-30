import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  
  static const name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavgationBar(),);
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          flexibleSpace: CustomAppbar(),
          floating: true,
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Column(
              children: [
          
                MoviesSlideShow(movies: slideShowMovies),
          
                MoviesHorizontalListView(
                  movies: nowPlayingMovies, 
                  title: 'Now Playing', 
                  subtitle: 'Monday 19',
                  loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: upcomingMovies, 
                  title: 'Soon', 
                  subtitle: 'This month',
                  loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: topRatedMovies, 
                  title: 'Top Rated', 
                  subtitle: 'All Times',
                  loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: popularMovies, 
                  title: 'Most Popular', 
                  //subtitle: 'All Times',
                  loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
                ),

                const SizedBox(height: 10,),
          
              ],
            ),
            childCount: 1,
            ),
            
            )
      ], 
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

final initialLoadingProvider = Provider<bool>(
  (ref) {
    final bool step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
    final bool step2 = ref.watch(popularMoviesProvider).isEmpty;
    final bool step3 = ref.watch(topRatedMoviesProvider).isEmpty;
    final bool step4 = ref.watch(upcomingMoviesProvider).isEmpty;

    return (step1||step2||step3||step4);
  },
);
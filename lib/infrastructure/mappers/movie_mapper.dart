import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_from_moviedb.dart';

class MovieMapper {
  
  static Movie moviedbToEntity(MovieFromMoviedb movieFromMoviedb) => Movie(
    adult: movieFromMoviedb.adult, 
    backdropPath: (movieFromMoviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movieFromMoviedb.backdropPath}' 
      : 'https://cdn.onlinewebfonts.com/svg/img_331373.png', 
    genreIds: movieFromMoviedb.genreIds.map((e) => e.toString()).toList(), 
    id: movieFromMoviedb.id, 
    originalLanguage: movieFromMoviedb.originalLanguage,
    originalTitle: movieFromMoviedb.originalTitle, 
    overview: movieFromMoviedb.overview, 
    popularity: movieFromMoviedb.popularity, 
    posterPath: (movieFromMoviedb.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movieFromMoviedb.posterPath}'
      : 'https://www.prokerala.com/movies/assets/img/no-poster-available.jpg', 
    releaseDate: movieFromMoviedb.releaseDate != null 
      ? movieFromMoviedb.releaseDate! 
      : DateTime.now(), 
    title: movieFromMoviedb.title, 
    video: movieFromMoviedb.video, 
    voteAverage: movieFromMoviedb.voteAverage, 
    voteCount: movieFromMoviedb.voteCount);

    static Movie movieDetailsToEntity (MovieDetails movieFromMoviedb) => Movie(
    adult: movieFromMoviedb.adult, 
    backdropPath: (movieFromMoviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movieFromMoviedb.backdropPath}' 
      : 'https://cdn.onlinewebfonts.com/svg/img_331373.png', 
    genreIds: movieFromMoviedb.genres.map((e) => e.name.toString()).toList(), 
    id: movieFromMoviedb.id, 
    originalLanguage: movieFromMoviedb.originalLanguage,
    originalTitle: movieFromMoviedb.originalTitle, 
    overview: movieFromMoviedb.overview, 
    popularity: movieFromMoviedb.popularity, 
    posterPath: (movieFromMoviedb.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movieFromMoviedb.posterPath}'
      : 'https://cdn.onlinewebfonts.com/svg/img_331373.png', 
    releaseDate: movieFromMoviedb.releaseDate, 
    title: movieFromMoviedb.title, 
    video: movieFromMoviedb.video, 
    voteAverage: movieFromMoviedb.voteAverage, 
    voteCount: movieFromMoviedb.voteCount);
}
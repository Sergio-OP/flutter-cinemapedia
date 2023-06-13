import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMoviedbKey = dotenv.env['THE_MOVIE_DB_KEY'] ?? 'Does not exist a MovieDB API Key';
}
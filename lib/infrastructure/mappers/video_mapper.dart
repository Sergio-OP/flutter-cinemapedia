import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_videos.dart';

class VideoMapper {

  static movieDbVideoToEntity( Result movieDbVideo) => Video(
    id: movieDbVideo.id, 
    name: movieDbVideo.name, 
    youtubeKey: movieDbVideo.key, 
    publishedAt: movieDbVideo.publishedAt
  );

}
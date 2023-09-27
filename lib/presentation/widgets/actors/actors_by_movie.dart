import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class ActorsByMovie extends ConsumerWidget {

  final String movieid;

  const ActorsByMovie({super.key, required this.movieid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if(actorsByMovie[movieid] == null){
      return Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 50),
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        ),
      );
    }
    
    final actors = actorsByMovie[movieid]!;
    
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];

          return Container(
            padding: const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Actor photo
                FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      image: NetworkImage(actor.profilePath),
                      placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 5,),
                // Nombre
                Text(
                  actor.name,
                  maxLines: 2,
                ),

                Text(
                  actor.character ?? '', 
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
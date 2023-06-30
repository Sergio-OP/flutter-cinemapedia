import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages(){

    final List<String> loadingMessages = [
      'Loading movies',
      'Cooking popcorns',
      'Calling to my girlfriend',
      'Almost finished',
      'Loading top rated',
      'This is taking more of waited...',
    ]; 

    return Stream.periodic(
      const Duration(milliseconds: 1200), 
      (computationCount) => loadingMessages[computationCount],).take(loadingMessages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please wait'),
          const SizedBox(height: 10,),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10,),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder:(context, snapshot) {
              if(!snapshot.hasData) return const Text('Starting load...');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_mania/services/watchlist_service.dart';

class WatchlistScreen extends StatelessWidget {
  final WatchlistService _watchlistService = WatchlistService();

  WatchlistScreen({super.key});

  void _removeFromWatchlist(BuildContext context, String movieId) async {
    try {
      await _watchlistService.removeFromWatchlist(movieId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Removed from Watchlist')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Watchlist')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _watchlistService.getWatchlist(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final movies = snapshot.data!.docs;

          if (movies.isEmpty) {
            return const Center(child: Text('No movies in watchlist.'));
          }

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index].data() as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  leading: Image.network(
                    movie['Poster'] ?? '',
                    width: 50,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image),
                  ),
                  title: Text(movie['Title'] ?? 'No title'),
                  subtitle: Text(movie['Year'] ?? 'No year'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeFromWatchlist(
                        context, movie['imdbID']),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

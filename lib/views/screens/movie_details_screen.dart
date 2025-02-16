import 'package:flutter/material.dart';
import 'package:movie_mania/services/omdb_apiservice_moviedetails.dart';
import 'package:movie_mania/services/watchlist_service.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieTitle;

  const MovieDetailsScreen({super.key, required this.movieTitle});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Map<String, dynamic>? movieDetails;
  final OmdbApiService_details apiService = OmdbApiService_details();
  final WatchlistService _watchlistService = WatchlistService();

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  void fetchDetails() async {
    final details = await apiService.fetchMovieDetails(widget.movieTitle);
    setState(() {
      movieDetails = details;
    });
  }

    Future<void> _addToWatchlist(Map<String, dynamic> movie) async {
    try {
      await _watchlistService.addToWatchlist(movie);
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to watchlist')),
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
      appBar: AppBar(
        title: Text(
          widget.movieTitle,
          style: TextStyle(
            fontSize: 30,
          ),),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        )),
      body: movieDetails == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (movieDetails!['Poster'] != 'N/A')
                      Image.network(movieDetails!['Poster'], height: 250, fit: BoxFit.cover),
                    const SizedBox(height: 10),
                    Text(
                      movieDetails!['Title'] ?? 'N/A',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Year: ${movieDetails!['Year'] ?? 'N/A'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Genre: ${movieDetails!['Genre'] ?? 'N/A'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'IMDb Rating: ${movieDetails!['imdbRating'] ?? 'N/A'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Plot:',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      movieDetails!['Plot'] ?? 'N/A',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 75),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: () => _addToWatchlist({
                        'imdbID': movieDetails!['imdbID'],
                        'Title': movieDetails!['Title'],
                        'Year': movieDetails!['Year'],
                        'Poster': movieDetails!['Poster'],}
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Watchlist',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),)
                      ),
                    )
                  ),
                  ],
                  
                ),
              ),
            ),
    );
  }
}

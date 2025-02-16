import 'package:flutter/material.dart';
import 'package:movie_mania/services/omdb_apiservice_moviedetails.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieTitle;

  const MovieDetailsScreen({super.key, required this.movieTitle});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Map<String, dynamic>? movieDetails;
  final OmdbApiService_details apiService = OmdbApiService_details();

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movieDetails!['Poster'] != 'N/A')
                    Image.network(movieDetails!['Poster'], height: 250, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  Text(
                    movieDetails!['Title'] ?? 'N/A',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
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
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WatchlistService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser?.uid ?? 'guest';

  Future<void> addToWatchlist(Map<String, dynamic> movie) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('watchlist')
          .doc(movie['imdbID'])
          .set(movie);
    } catch (e) {
      throw Exception('Failed to add to watchlist: $e');
    }
  }

  Stream<QuerySnapshot> getWatchlist() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('watchlist')
        .snapshots();
  }

  Future<void> removeFromWatchlist(String movieId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('watchlist')
          .doc(movieId)
          .delete();
    } catch (e) {
      throw Exception('Failed to remove from watchlist: $e');
    }
  }
}

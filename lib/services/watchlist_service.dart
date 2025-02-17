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
        .collection('users') //access data collection users
        .doc(userId) //access subcollection docs corresponding to userId of a user
        .collection('watchlist') //access subcollection watchlist of docs within user
        .snapshots(); //update data in real time
  } //listens to real time changes in watchlist

  Future<void> removeFromWatchlist(String movieId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('watchlist') 
          .doc(movieId) // access docs corresponding to movieId within watchlist
          .delete(); // delete current document
    } catch (e) {
      throw Exception('Failed to remove from watchlist: $e');
    }
  }
}

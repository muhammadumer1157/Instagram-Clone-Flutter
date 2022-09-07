import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String photoUrl;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "Username": username,
        "Email": email,
        "PhotoUrl": photoUrl,
        "Uid": uid,
        "Bio": bio,
        "Followers": followers,
        "Following": following
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        username: snapshot['Username'],
        email: snapshot['Email'],
        uid: snapshot['Uid'],
        bio: snapshot['Bio'],
        followers: snapshot['Followers'],
        following: snapshot['Following'],
        photoUrl: snapshot['PhotoUrl']);
  }
}

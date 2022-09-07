import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "Username": username,
        "Description": description,
        "Uid": uid,
        "Likes": likes,
        "PostUrl": postUrl,
        "ProfImage": profImage,
        'PostId': postId,
        'DatePublished': datePublished
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        username: snapshot['Username'],
        description: snapshot['Description'],
        uid: snapshot['Uid'],
        likes: snapshot['Likes'],
        postUrl: snapshot['PostUrl'],
        profImage: snapshot['ProfImage'],
        postId: snapshot['PostId'],
        datePublished: snapshot['DatePublished']);
  }
}

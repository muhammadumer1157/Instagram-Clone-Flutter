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
}
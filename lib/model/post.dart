import 'user.dart';

class Post {
  User? user;
  String? image;
  String? title;
  int? likes;
  int? comments;

  Post({this.user, this.image, this.title, this.likes, this.comments,});
}

List<Post> instagramPosts = [
  Post(
    user: User(
      name: 'Kareem Ahmed',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6SGvshARHJ5GYSH_Kig8-cYNw5rO3nWn7mA&usqp=CAU',
    ),
    image: 'https://www.manchesterdigital.com/storage/13254/flutter-3.png',
    title: 'Flutter is awesome',
    comments: 10,
    likes: 100,
  ),
  Post(
    user: User(
      name: 'Ay Shaya',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNhLbDXZVcPpBmD4-DLdKuAMj6y3wwfD_1dg&usqp=CAU',
    ),
    image: 'https://cdn.oneesports.gg/cdn-data/2022/10/AvatarLiveAction_Netflix_FullCast_Aang_Katara-Sokka_Zuko_Actors2.jpg',
    title: 'Avatar Family is Awesome too',
    comments: 1,
    likes: 76,
  ),
  Post(
    user: User(
      name: 'Ahmed Fawzy',
      image: 'https://imgv3.fotor.com/images/gallery/american-anime-stule-naked-man-avatar.jpg',
    ),
    image: 'https://cdn.whats-on-netflix.com/wp-content/uploads/2023/09/19054943/netflix-avatar-the-last-airbender-cast-list.jpg',
    title: 'Avatar Family is Awesome too 2 Loream Ipsum adsflkj slkfjs lkjdflk sjdf lksjfdlk',
    comments: 123,
    likes: 978,
  ),
];
import 'package:flutter/material.dart';
import 'package:flutter_113/model/post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstagramPostWidget extends StatelessWidget {
  final Post post;
  const InstagramPostWidget({required this.post, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: Image.network(
                  post.user?.image ?? '',
                ).image,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  post.user?.name ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.more_horiz_rounded, color: Colors.white),
            ],
          ),
        ),
        Image.network(
          post.image ?? '',
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.comment,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 4,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 4,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 4,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 4,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 3,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.bookmark_border_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: Image.network(
                      'https://pbs.twimg.com/profile_images/1141781661551665153/BMnvVd2u_400x400.jpg',
                    ).image,
                    radius: 12,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Liked by ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'flutter.divisor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' and ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${post.likes ?? ''} Others',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                post.title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'View ${post.comments ?? ''} Comment',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: Image.network(
                      'https://cdn.vox-cdn.com/thumbor/8ur1WnO0cvMHesiqupcq7-my87k=/1400x788/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/21730161/avatar_the_last_airbender_image.jpeg',
                    ).image,
                    radius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey[600]!,
                              width: 2,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey[600]!,
                              width: 2,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey[600]!,
                              width: 2,
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

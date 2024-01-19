import 'package:flutter/material.dart';
import 'package:flutter_113/model/post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/instagram_post_widget.dart';
import '../login_screen.dart';

class InstagramScreen extends StatelessWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Instagram',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Icon(Icons.add_box_outlined, color: Colors.white, size: 35),
          SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              PositionedDirectional(
                top: 10,
                end: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Icon(
                  FontAwesomeIcons.facebookMessenger,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              PositionedDirectional(
                top: 10,
                end: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false,
              );
            },
            icon: Icon(
              Icons.exit_to_app_rounded,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return InstagramPostWidget(
            post: instagramPosts[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: instagramPosts.length,
      ),
    );
  }
}

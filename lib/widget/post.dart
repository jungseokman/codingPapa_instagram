import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/common_size.dart';
import 'package:instagram/widget/comment.dart';
import 'package:instagram/widget/my_progress_indicator.dart';
import 'package:instagram/widget/rounded_avatar.dart';

class Post extends StatelessWidget {
  final int index;

  const Post(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Padding _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_xxs_gap, vertical: common_gap),
      child: Comment(
        showImage: false,
        username: 'soekmanJung',
        text: 'i have money',
        dateTime: DateTime.now(),
      ),
    );
  }

  Padding _postLikes() {
    return const Padding(
      padding: EdgeInsets.only(left: common_xxs_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: const [
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage(
              'assets/images/bookmark.png',
            ),
            color: Colors.black87,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage(
              'assets/images/comment.png',
            ),
            color: Colors.black87,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage(
              'assets/images/direct_message.png',
            ),
            color: Colors.black87,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage(
              'assets/images/heart_selected.png',
            ),
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text('username')),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ))
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/${index + 20}/200/200',
      placeholder: (context, string) {
        return const MyProgressIndicator();
      },
      imageBuilder: (context, imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}

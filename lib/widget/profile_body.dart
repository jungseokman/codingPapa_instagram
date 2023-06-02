import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/widget/rounded_avatar.dart';
import '../constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    Key? key,
    required this.onMenuChange,
  }) : super(key: key);

  final Function onMenuChange;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  bool isSelectedBtn = true;
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _appBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(common_gap),
                          child: RoundedAvatar(
                            size: 80,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: common_gap),
                            child: Table(
                              children: [
                                TableRow(
                                  children: [
                                    _textValue('123123', true),
                                    _textValue('456456', true),
                                    _textValue('789789', true),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _textValue('Post', false),
                                    _textValue('Follower', false),
                                    _textValue('Following', false),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    _username(),
                    _userBio(),
                    const SizedBox(
                      height: common_xxs_gap,
                    ),
                    _editProfileButton(),
                    _tabButton(),
                    _selectedIndicator(),
                  ],
                ),
              ),
              _imagesPager()
            ],
          ),
        ),
      ],
    );
  }

  Row _appBar() {
    return Row(
      children: [
        const SizedBox(
          width: 46,
        ),
        const Expanded(
            child: Text(
          'Jung seok man',
          textAlign: TextAlign.center,
        )),
        IconButton(
          onPressed: () {
            widget.onMenuChange();
            _iconAnimationController.status == AnimationStatus.completed
                ? _iconAnimationController.reverse()
                : _iconAnimationController.forward();
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _iconAnimationController,
          ),
        )
      ],
    );
  }

  Text _textValue(String value, bool style) {
    return Text(
      value,
      style: TextStyle(
        fontWeight: style ? FontWeight.bold : FontWeight.w300,
        fontSize: style ? 14 : 11,
      ),
      textAlign: TextAlign.center,
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(
                isSelectedBtn ? 0 : -size!.width, 0, 0),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                30,
                (index) => CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/id/${index + 20}/100/100',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(
                !isSelectedBtn ? 0 : size!.width, 0, 0),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                30,
                (index) => CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/id/${index + 50}/100/100',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment: isSelectedBtn ? Alignment.centerLeft : Alignment.centerRight,
      curve: Curves.fastOutSlowIn,
      child: Container(
        height: 3,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.black87,
      ),
    );
  }

  Row _tabButton() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                isSelectedBtn = true;
              });
            },
            icon: ImageIcon(
              const AssetImage('assets/images/grid.png'),
              color: isSelectedBtn ? Colors.black : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                isSelectedBtn = false;
              });
            },
            icon: ImageIcon(
              const AssetImage('assets/images/saved.png'),
              color: !isSelectedBtn ? Colors.black : Colors.black26,
            ),
          ),
        ),
      ],
    );
  }

  Padding _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text(
            'Edit Profile',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding _userBio() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'This is what I believe!!',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _username() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

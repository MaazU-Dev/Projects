import 'package:flutter/material.dart';

import 'AlbumViewCard.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({Key? key}) : super(key: key);

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  ScrollController? _scrollController;
  double imageSize = 0;
  double initialSize = 400;
  double containerheight = 600;
  double containerInitialHeight = 600;
  double imageOpacity = 1;
  bool showTopBar = false;
  double? extendedHeight;
  bool showExtendedHeight = false;
  bool showAppBar = false;
  double? appBarOpacity;

  @override
  void initState() {
    // TODO: implement initState

    imageSize = initialSize;
    extendedHeight = 40;

    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      imageSize -= _scrollController!.offset * 0.5;
      imageOpacity = imageSize / initialSize;

      if (_scrollController!.offset > 238) {
        showAppBar = true;
      }
      if (_scrollController!.offset <= 238) {
        showAppBar = false;
      }
      if (_scrollController!.offset > -50) {
        showExtendedHeight = true;
      }
      if (_scrollController!.offset > 40) {
        showExtendedHeight = false;
        setState(() {});
      }
      if (_scrollController!.offset > -40) {
        showTopBar = true;
      }
      if (imageOpacity < 0) {
        imageOpacity = 0;
      }
      if (imageOpacity > 1) {
        imageOpacity = 1;
      }
      if (imageSize < 0) {
        imageSize = 0;
      }
      if (imageSize > 500) {
        imageSize = 500;
      }
      containerheight = containerInitialHeight - _scrollController!.offset;
      if (containerheight < 0) {
        containerheight = 0;
      }
      appBarOpacity = showAppBar ? 1.0 : 0.0;
      setState(() {});
      print(_scrollController!.offset);
    });
    super.initState();
  }

  //Increase container size
  //move all widgets down

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: showExtendedHeight
                ? containerheight + extendedHeight!
                : containerheight,
            width: MediaQuery.of(context).size.width + containerheight,
            color: Colors.deepPurpleAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: showExtendedHeight ? extendedHeight : null,
                ),
                Flexible(
                  child: Opacity(
                    opacity: imageOpacity.clamp(
                      0,
                      1.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 50,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'images/album9.jpeg',
                        width: imageSize - 100,
                        height: imageSize - 100,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: showExtendedHeight ? 200 - extendedHeight! : 200,
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
/*
                    clipBehavior: Clip.none,
*/
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.62,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: showExtendedHeight
                                ? extendedHeight! + (initialSize - 100)
                                : initialSize - 100,
                          ),
                          /*SizedBox(
                            height: showExtendedHeight ? 5.0 + extendedHeight! : 5.0,
                          ),*/
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/logo.png',
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Spotify',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  '1,538,690 likes • 7h 42m',
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 6.0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.favorite_border_outlined),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.save_alt),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.more_vert_outlined),
                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 64,
                                        height: 64,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF14D860),
                                        ),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
                                          size: 35,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: 27,
                                          height: 27,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.shuffle_outlined,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /*Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.favorite_border_outlined),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.save_alt),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.more_vert_outlined),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.shuffle_outlined),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.play_circle_fill_outlined),
                                  ],
                                )
                              ],
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.none,
                    color: Colors.black,
                    height: showExtendedHeight! ? 500 - extendedHeight! : 600,
                    child: Column(
                      children: [
                        AlbumViewCard(imageLinkText: 'images/album4.jpeg', titleLabel: 'Reminder', nameLabel: 'Justin Beiber, Selena Gomes',),
                        AlbumViewCard(imageLinkText: 'images/album7.jpeg', titleLabel: 'Roosevolt', nameLabel: 'Umer Sohail, A\$ap Rockey',),
                        AlbumViewCard(imageLinkText: 'images/album8.jpeg', titleLabel: 'Strangers', nameLabel: 'Shawn Mendes, Camilla Cabello',),
                        AlbumViewCard(imageLinkText: 'images/album9.jpeg', titleLabel: 'Kaavish', nameLabel: 'Camilla Cabello. Ai Sethi',),
                        AlbumViewCard(imageLinkText: 'images/album11.jpeg', titleLabel: 'Bol', nameLabel: 'Rizwan Anwar, Camilla Cabello',),
                        AlbumViewCard(imageLinkText: 'images/album5.jpeg', titleLabel: 'Shadows', nameLabel: 'Mahira Khan, Ahmad Raza',),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: showTopBar
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 21.0,
                      horizontal: 21.0,
                    ),
                    child: Opacity(
                      opacity: imageOpacity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 35,
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  height:
                                      MediaQuery.of(context).size.width * 0.09,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(
                                      imageOpacity.clamp(0, 0.5),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 5,
                                  top: 5,
                                  child: Icon(
                                    Icons.search_outlined,
                                  ),
                                ),
                                Positioned(
                                  top: 7.5,
                                  left: 35,
                                  child: Text(
                                    'Find in playlist',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                  height:
                                      MediaQuery.of(context).size.width * 0.09,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(
                                      imageOpacity.clamp(0, 0.5),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 9,
                                  left: 11,
                                  child: Text(
                                    'Sort',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ),
          SafeArea(
            child: showAppBar
                ? AnimatedOpacity(
                    duration: Duration(seconds: 4),
                    curve: Curves.decelerate,
                    opacity: appBarOpacity!,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          'Top-50 Global',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          Positioned(
            top: -9,
            left: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


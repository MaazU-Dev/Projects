import 'package:flutter/material.dart';
import 'package:musify_ui/AlbumView.dart';

import 'AlbumCard.dart';
import 'BigCard.dart';
import 'ElongatedCard.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.5),
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(1),
                ]),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(1),
                  ]),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently Played',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.history),
                            SizedBox(
                              width: 8.0,
                            ),
                            Icon(Icons.settings),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12.0),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        AlbumCard(
                          imageLinkText: 'images/album1.jpeg',
                          label: 'Album 1',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlbumView(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        AlbumCard(
                          imageLinkText: 'images/album2.jpeg',
                          label: 'Album 2',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlbumView(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        AlbumCard(
                          imageLinkText: 'images/album3.jpeg',
                          label: 'Album 3',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlbumView(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        AlbumCard(
                          imageLinkText: 'images/album4.jpeg',
                          label: 'Album 4',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlbumView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Evening',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            ElongatedCard(
                              imageLinkText: 'images/album9.jpeg',
                              label: 'Top-50 Global',
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElongatedCard(
                              imageLinkText: 'images/album6.jpeg',
                              label: 'Top-10 Indie',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            ElongatedCard(
                              imageLinkText: 'images/album8.jpeg',
                              label: 'Hot Indie',
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElongatedCard(
                              imageLinkText: 'images/album7.jpeg',
                              label: 'Hot Global',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            ElongatedCard(
                              imageLinkText: 'images/album5.jpeg',
                              label: 'Oh G-Spot',
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElongatedCard(
                              imageLinkText: 'images/album3.jpeg',
                              label: 'Smurfic Hotie',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Based on your recent listening',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                            top: 12.0,
                          ),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              BigCard(
                                imageLinkText: 'images/album10.jpeg',
                                label:
                                    'Justin Boober, Gaylor Swift, Rizwan Anwar, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album11.jpeg',
                                label:
                                    'Gaylor Swift, Justin Boober, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album12.jpeg',
                                label:
                                    'Selena Germans, Umer Sohail, Gaylor Swift, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album13.jpeg',
                                label:
                                    'Ali Sethi, Atif Aslam, Imran Khan, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album14.jpeg',
                                label:
                                    'Doja pussy, Mitraz, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album15.jpeg',
                                label:
                                    'A\$ap Rocky, Gaylor Swift, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album1.jpeg',
                                label:
                                    'Harry Gayles, Camila Cab, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album2.jpeg',
                                label:
                                    'BTSisgay, Aditya RIkhari, Selena germs, shawn meadows...',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommended radio',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              BigCard(
                                imageLinkText: 'images/album9.jpeg',
                                label:
                                    'Justin Boober, Gaylor Swift, Rizwan Anwar, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album6.jpeg',
                                label:
                                    'Gaylor Swift, Justin Boober, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album4.jpeg',
                                label:
                                    'Selena Germans, Umer Sohail, Gaylor Swift, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album12.jpeg',
                                label:
                                    'Ali Sethi, Atif Aslam, Imran Khan, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album5.jpeg',
                                label:
                                    'Doja pussy, Mitraz, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album2.jpeg',
                                label:
                                    'A\$ap Rocky, Gaylor Swift, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album11.jpeg',
                                label:
                                    'Harry Gayles, Camila Cab, Selena germs, shawn meadows...',
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              BigCard(
                                imageLinkText: 'images/album7.jpeg',
                                label:
                                    'BTSisgay, Aditya RIkhari, Selena germs, shawn meadows...',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

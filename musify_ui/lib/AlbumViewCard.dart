import 'package:flutter/material.dart';

class AlbumViewCard extends StatelessWidget {
  const AlbumViewCard({
    required this.imageLinkText,
    required this.titleLabel,
    required this.nameLabel,
  });
  final String imageLinkText;
  final String titleLabel;
  final String nameLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0,),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imageLinkText,
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titleLabel,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      nameLabel,
                      style: TextStyle(
                        color: Colors.grey,
                      ),

                    ),

                  ],

                ),
              ],
            ),
            const Icon(Icons.more_horiz_outlined,
              color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}

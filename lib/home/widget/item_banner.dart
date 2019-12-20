import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                          "https://images-loyalty.ovo.id/public/deal/31/95/l/25239.jpg?ver=1"))),
            ),
          );
        },
      ),
    );
  }
}

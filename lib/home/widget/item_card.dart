import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
           return Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 200/1.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images-loyalty.ovo.id/public/deal/31/95/l/25239.jpg?ver=1"))),
                ),
                Text("Warung 1",style: Theme.of(context).textTheme.body2),
              ],
            ),
          );
        },
      ),
    );
  }
}

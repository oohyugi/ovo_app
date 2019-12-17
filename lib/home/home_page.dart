import 'package:flutter/material.dart';
import 'package:ovo_app/home/widget/appbar_balance.dart';
import 'package:ovo_app/home/widget/dasboard_grid.dart';
import 'package:ovo_app/home/widget/item_banner.dart';
import 'package:ovo_app/home/widget/item_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: AppbarBalance(
              expandedHeight: MediaQuery.of(context).size.width / 2.5),
        ),
        SliverPadding(
            padding: EdgeInsets.only(top: 42), sliver: DasboardGrid()),
        ListItem(title: "CashBack Bikin Melek",subtitle: "",itemChild: ItemBanner(),),
        ListItem(title: "Merchant Didekat Kamu",subtitle: "Ada banyak merchant menarik di sekitar kamu yang harus dicobain. Cek sekarang, yuk!",itemChild: ItemCard(),),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (_, index) => ListTile(
                    title: Text("Index: $index"),
                  ),
              childCount: 10),
        )
      ],
    );
  }


}

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget itemChild;

  const ListItem({Key key, this.title, this.subtitle, this.itemChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                ),
                Text(
                  "Lihat semua",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Visibility(
              visible: subtitle != "",
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 12),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: itemChild,
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:ovo_app/models/dashboard_mdl.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("OVO"),
        centerTitle: false,
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: null),
              Positioned(
                  right: 11.0,
                  top: 11.0,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    constraints:
                        BoxConstraints(minHeight: 12.0, minWidth: 12.0),
                  ))
            ],
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBar(
                expandedHeight: MediaQuery.of(context).size.width / 2.5),
          ),
          _dashboarMenuView(context),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => ListTile(
                title: Text("Index: $index"),
              ),
              childCount: 10
            ),
          )
        ],
      ),
    );
  }

  List<DashboardMdl> mListDasboard = List();

  _dashboarMenuView(BuildContext context) {
    mListDasboard.add(
        DashboardMdl.fromValue(id: 1, title: "PLN", icon: Icons.scatter_plot));
    mListDasboard
        .add(DashboardMdl.fromValue(id: 1, title: "Pulsa", icon: Icons.call));
    mListDasboard.add(DashboardMdl.fromValue(
        id: 1, title: "Paket Data", icon: Icons.data_usage));
    mListDasboard.add(DashboardMdl.fromValue(
        id: 1, title: "Pasca Bayar", icon: Icons.bug_report));
    mListDasboard
        .add(DashboardMdl.fromValue(id: 1, title: "BPJS", icon: Icons.event));
    mListDasboard
        .add(DashboardMdl.fromValue(id: 1, title: "TV Kabel", icon: Icons.tv));
    mListDasboard.add(DashboardMdl.fromValue(
        id: 1, title: "Streaming", icon: Icons.view_stream));
    mListDasboard.add(
        DashboardMdl.fromValue(id: 1, title: "Lainnya", icon: Icons.dashboard));
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 0.8, mainAxisSpacing: 0),
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            margin: EdgeInsets.only(top: 42),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          mListDasboard[index].icon,
                          color: Colors.white,
                        ),
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 70,
                  child: Center(
                    child: Text(
                      mListDasboard[index].title,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        }, childCount: mListDasboard.length));
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 60))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Available Balance",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Rp",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "1000.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.7 - shrinkOffset,
          left: 14,
          right: 14,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_circle_outline,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Top Up",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.call_missed_outgoing,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Transfer",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.history,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "History",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

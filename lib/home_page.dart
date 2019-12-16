import 'package:flutter/material.dart';
import 'package:ovo_app/models/dashboard_mdl.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[_balanceView(context), _dashboarMenuView(context)],
        ),
      ),
    );
  }

  Stack _balanceView(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 60))),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Available Balance",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Row(
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
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: MediaQuery.of(context).size.height / 5,
              bottom: 14),
          child: Material(
            borderRadius: BorderRadius.circular(14.0),
            elevation: 4,
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
      ],
    );
  }

   List<DashboardMdl> mListDasboard = List();
  
  _dashboarMenuView(BuildContext context) {
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "PLN",icon:Icons.scatter_plot ));
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "Pulsa",icon:Icons.call ));
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "Paket Data",icon:Icons.data_usage ));
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "Pasca Bayar",icon:Icons.bug_report ));
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "BPJS",icon:Icons.event ));
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "TV Kabel",icon:Icons.tv ));
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "Streaming",icon:Icons.view_stream ));
    mListDasboard.add(DashboardMdl.fromValue(id: 1,title: "Lainnya",icon:Icons.dashboard ));
    return Container(

      child: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: mListDasboard.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),

            itemBuilder: (context, index) {
              return
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          //Navigator.of(context).pushNamed(ELECTRONICS_ITEM_LIST);
                          print('Routing to Electronics item list');
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.green[100],
                            ),child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(mListDasboard[index].icon,color: Colors.green[800],),
                            )),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Flexible(
                        child: Text(
                          mListDasboard[index].title,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  );

            }
          ),
        ),

    );
  }
}

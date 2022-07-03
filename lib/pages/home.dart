import 'package:coinapp/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("CoinApp"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.circle_notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Authentication(),
                ),
              );
            },
          )
        ],
        actionsIconTheme: IconThemeData(
          size: 32,
        ),
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(children: <Widget>[
            Center(
                child: StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return IconButton(
                          onPressed: () {}, icon: Icon(Icons.verified_user));
                    }
                  },
                )),
            FutureBuilder<WorldTime>(
                future: getNow(),
                builder: (BuildContext context, AsyncSnapshot<WorldTime> wt) {
                  if (wt.hasData) {
                    return Column(children: <Widget>[
                      Center(
                          child: Text(
                            (wt.data!.datetime),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                            ),
                          )),
                      Center(
                          child: Text(
                            (wt.data!.timezone),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                            ),
                          )),
                      Center(
                          child: Text(
                            (wt.data!.clientip),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                            ),
                          )),
                    ]);
                  } else {
                    return Center(child: Text("nodata"));
                  }
                })
          ]),
        ),
      ),
    );
  }
}

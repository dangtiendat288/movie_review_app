import 'package:flutter/material.dart';
import 'package:movie_review_app/widgets/tab_bar.dart';
import 'package:movie_review_app/widgets/tab_bar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: Column(
        children: [
          tabBar(controller: _tabController),
          tabBarView(controller: _tabController)
        ],
      ),
    );
  }
}

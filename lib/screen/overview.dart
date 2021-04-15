import 'package:flutter/material.dart';
import '../constant/drawer.dart';
import '../constant/texts.dart';
import '../models/TabBar/electronics.dart';
import '../models/TabBar/jewelery.dart';
import '../models/TabBar/men_clothing.dart';
import '../models/TabBar/women_clothing.dart';



class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState(){
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Product by categories'),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(
                child: Texts(weights: FontWeight.w600, title: 'Electronics', colors: null, size: 14, family: null)
            ),
            Tab(
              child: Texts(weights:FontWeight.w600, title: 'Jewelery',colors: null, size: 14, family: null),
            ),
            Tab(
              child: Texts(weights: FontWeight.w600, title: 'Men Clothing', colors: null, size: 14, family: null),
            ),
            Tab(
              child: Texts(weights: FontWeight.w600, title: 'Women Clothing', colors: null, size: 14, family: null),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      body:  TabBarView(
        controller: _tabController,
        children: [
          Electronics(),
           Jewelery(),
           MenClothing(),
           WomenClothing(),
        ],
      ),
    );
  }
}



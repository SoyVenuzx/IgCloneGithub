import 'package:flutter/material.dart';
import 'package:myapp/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Experience',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String> posts = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/8.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 10),
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScolled) {
            return [
              const SliverAppBar(
                backgroundColor: Colors.white,
                collapsedHeight: 250,
                expandedHeight: 250,
                flexibleSpace: ProfileView(),
              ),
              SliverPersistentHeader(
                delegate: MyDelegate(const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.favorite_border_outlined)),
                    Tab(icon: Icon(Icons.bookmark_border)),
                  ],
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                )),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: TabBarView(
              children: [1, 2, 3]
                  .map((tab) => GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        children: posts
                            .map((post) => Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(post),
                                          fit: BoxFit.fill)),
                                ))
                            .toList(),
                      ))
                  .toList()),
        ),
      ),
    ));
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

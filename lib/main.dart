import 'package:flutter/material.dart';
import 'package:nihao_flutter/demo/form_demo.dart';
import 'package:nihao_flutter/demo/material_components.dart';
import 'package:nihao_flutter/demo/state/state-management.dart';
import 'demo/layout_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/listview_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigatorDemo(),
      // home: Home(),
      // home: SliverDemo(),
      initialRoute: '/state-management',
      // initialRoute: '/',
      // 顶层路由表
      routes: {
        // '/': (context) => NavigatorDemo(),
        '/about': (context) => AboutPage(title: 'About'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
      },
      // 全局Theme
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('NINHAO'),
          actions: <Widget>[
            IconButton(
              onPressed: () => debugPrint('Search button is pressed!'),
              icon: Icon(Icons.search),
              tooltip: 'Search',
            ),
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
              Tab(icon: Icon(Icons.add_business)),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          ListViewDemo(),
          BasicDemo(),
          LayoutDemo(),
          ViewDemo(),
          SliverDemo(),
        ]),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

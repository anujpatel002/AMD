import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget image1 = Image.asset(
      'lib/assets/images/img1.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );

    Widget image2 = Image.asset(
      'lib/assets/images/img1.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );

    Widget image3 = Image.asset(
      'lib/assets/images/img1.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );

    Widget image4 = Image.asset(
      'lib/assets/images/img1.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );

    Widget image5 = Image.asset(
      'lib/assets/images/img1.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );

    Widget image6 = Image.asset(
      'lib/assets/images/img1.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );

    Row rowTab = Row(
      mainAxisSize: MainAxisSize.min,
      children: [image1, SizedBox(width: 12), image2, SizedBox(width: 12), image3],
    );

    Column columnTab = Column(
      mainAxisSize: MainAxisSize.min,
      children: [image4, SizedBox(height: 12), image5, SizedBox(height: 12), image6],
    );

    Container firstTab = Container(
      color: Colors.orangeAccent,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: rowTab,
        ),
      ),
    );

    Container secondTab = Container(
      color: Colors.lightBlueAccent,
      child: Center(child: columnTab),
    );

    TabBar tabBar = TabBar(
      tabs: [
        Tab(text: 'Row Tab'),
        Tab(text: 'Column Tab'),
      ],
    );

    TabBarView tabBarView = TabBarView(
      children: [firstTab, secondTab],
    );

    Column bodyColumn = Column(
      children: [
        tabBar,
        Expanded(child: tabBarView),
      ],
    );

    DefaultTabController defaultTabController = DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('Tabs Example')),
        body: bodyColumn,
      ),
    );

    MaterialApp app = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: defaultTabController,
    );

    return app;
  }
}

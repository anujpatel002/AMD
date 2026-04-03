import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget i1 = Image.asset('lib/assets/images/img1.png', width: 90, height: 90, fit: BoxFit.cover);
    Widget i2 = Image.asset('lib/assets/images/img2.png', width: 90, height: 90, fit: BoxFit.cover);
    Widget i3 = Image.asset('lib/assets/images/img3.png', width: 90, height: 90, fit: BoxFit.cover);
    Widget i4 = Image.asset('lib/assets/images/img4.png', width: 90, height: 90, fit: BoxFit.cover);
    Widget i5 = Image.asset('lib/assets/images/img5.png', width: 90, height: 90, fit: BoxFit.cover);
    Widget i6 = Image.asset('lib/assets/images/img6.png', width: 90, height: 90, fit: BoxFit.cover);

    Row rowView = Row(mainAxisSize: MainAxisSize.min, children: [i1, SizedBox(width: 8), i2, SizedBox(width: 8), i3]);
    Column colView = Column(mainAxisSize: MainAxisSize.min, children: [i4, SizedBox(height: 8), i5, SizedBox(height: 8), i6]);

    Container tab1 = Container(
      color: Colors.orangeAccent,
      child: Center(child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: rowView)),
    );

    Container tab2 = Container(
      color: Colors.lightBlueAccent,
      child: Center(child: colView),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: Text('Tabs Assets')),
          body: Column(
            children: [
              TabBar(tabs: [Tab(text: 'Row'), Tab(text: 'Column')]),
              Expanded(child: TabBarView(children: [tab1, tab2])),
            ],
          ),
        ),
      ),
    );
  }
}

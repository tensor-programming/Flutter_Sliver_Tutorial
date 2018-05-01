import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Example'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              'Sliver App Bar',
            ),
            floating: true,
            // pinned: true,
            centerTitle: true,
            elevation: 10.0,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'http://lorempixel.com/output/abstract-q-c-1920-1080-8.jpg',
                fit: BoxFit.cover,
              ),
              title: Text('Spacebar Title'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 5.0,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.purple[100 * (index % 9)],
                child: Text('Grid Item: $index'),
              );
            }, childCount: 102),
          ),
          SliverFillViewport(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                child: Text('Sliver Fill Viewport'),
                color: Colors.lightBlue,
              );
            }, childCount: 2),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            // delegate: SliverChildListDelegate([
            //   Text('1'),
            //   Text('2'),
            //   Text('3'),
            //   Text('4'),
            // ]),

            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.indigo[100 * (index % 9)],
                child: Text('List Item: $index'),
              );
            }),
          )
        ],
      ),
    );
  }
}

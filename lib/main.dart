import 'package:firstflutterapp/models/items.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Alex App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData( primarySwatch: Colors.brown ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  var items = new List<Item>();
  MyHomePage(){
    items = [];
    items.add(Item(title: "Flutter", done: false));
    items.add(Item(title: "Ionic", done: true));
    items.add(Item(title: "React Native", done: false));
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.camera),
        title: Text("List"),
        actions: <Widget>[
          Icon(Icons.settings)
        ],
      ),
      body:
           ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index){
              final item = widget.items[index];
              return CheckboxListTile(
                key: Key(item.id),
                title: Text(item.title),
                value: item.done,
                onChanged: (value){
                  setState(() {
                    item.done = value;
                  });
                },
              );
            }
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(height: 50.0,
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.brown,
                fontSize: 17
              ),
              decoration: InputDecoration(
                labelText: "Novo Item",
                labelStyle: TextStyle(
                  color: Colors.black54
                ),
              ),
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

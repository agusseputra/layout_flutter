import 'package:flutter/material.dart';
//Top Level/Root
void main() => runApp(MyApp());
//Widget StatelessWidget digunakan untuk menangani aplikasi sederhana
class MyApp extends StatelessWidget {
@override
//Isi dari widget
Widget build(BuildContext context) {
//Material App
return MaterialApp(
title: 'First App',
//Home Page
home: MyHomePage(),
);
}
}

//Edit dibagian ini
class MyHomePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
//seluruh body dibungkus column
body: new Column(
children: <Widget>[
Image.asset("assets/appimages/buyan.jpg"),
//setiap bagian pada body dipisahkan container
Container(
  color: Colors.blueAccent[100],
  padding: const EdgeInsets.all(10),
  //untuk membuat tampilan secara horisontal maka digunakan row
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Danau Buyan',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Buleleng, Bali - Indonesia',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
),
//setiap bagian pada body dipisahkan container
Container(
  padding: EdgeInsets.only(top: 10, bottom: 10),
  decoration: BoxDecoration(
    border: Border(
        bottom: BorderSide(color: Theme.of(context).dividerColor)),
  ),
  //untuk membuat tampilan secara horisontal maka digunakan row
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      //untuk membuat tampilan secara vertikal maka digunakan column
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.phone, color: Colors.blue),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              "CALL",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.near_me, color: Colors.blue),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              "ROUTE",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.share, color: Colors.blue),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              "SHARE",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      )
    ],
  ),
),
Container(
  padding: EdgeInsets.all(10),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
)
],
),
);
}
}

//menggunakan widget StatelessWidget
class ProductBox extends StatelessWidget {
//deklarasi variabel yang diterima dari MyHomePage
ProductBox(
{Key key, this.name, this.description, this.price, this.image, this.star})
: super(key: key);
//menampung variabel yang diterima untuk dapat digunakan pada class ini
final String name;
final String description;
final int price;
final String image;
final int star;
final children = <Widget>[];

Widget build(BuildContext context) {
for (var i = 0; i < star; i++) {
children.add(new Icon(
Icons.star,
size: 10,
color: Colors.deepOrange,
));
}
//menggunakan widget container
return Container(
//padding
padding: EdgeInsets.all(10),
// height: 120,
//menggunakan widget card
child: Card(
  //membuat tampilan secara horisontal antar image dan deskripsi
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //children digunakan untuk menampung banyak widget
      children: <Widget>[
    Image.asset(
      "assets/appimages/" + image,
      width: 150,
    ),
    Expanded(
        //child digunakan untuk menampung satu widget
        child: Container(
            padding: EdgeInsets.all(5),
            //membuat tampilan secara vertikal
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //ini isi tampilan vertikal tersebut
              children: <Widget>[
                //menampilkan variabel menggunakan widget text
                Text(this.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text(this.description),
                Text(
                  "Price: " + this.price.toString(),
                  style: TextStyle(color: Colors.red),
                ),
                //menampilkan widget icon  dibungkus dengan row
                Row(
                  children: <Widget>[
                    Row(
                      children: children,
                    )
                  ],
                )
              ],
            )))
  ])));
}
}

import 'package:flutter/material.dart';
//import terlebih dahulu halaman yang diperlukan
import './detailproduk.dart';

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
        //appbar
        appBar: AppBar(title: Text("Product Listing")),
        //body untuk content
        //menampilkan list
        body: ListView(
          shrinkWrap: true,
          //padding
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          //anggota dari list berupa widget children
          children: <Widget>[
            //GestureDetector untuk menangani gesture pengguna
            new GestureDetector(
              //listener  berupa klik 1x
              onTap: () {
                //navigator.push  untuk berpindah halaman
                Navigator.of(context).push(new MaterialPageRoute(
                  //pemanggilan class DetailProduk beserta pengiriman detail produk
                  builder: (BuildContext context) => DetailProduk(
                    name: "ACER",
                    description: "Ini laptop ACer Cangih",
                    price: 1000,
                    image: "acer.png",
                    star: 1,
                  ),
                ));
              },
              //memanggil class Productbox
              child: ProductBox(
                  //berisi parameter yang diperlukan di class ProductBox
                  name: "ACERs",
                  description: "Ini laptop ACer Cangih",
                  price: 1000,
                  image: "acer.png",
                  star: 1),
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Adventors",
                      description: "Pixel is the most featureful phone ever",
                      price: 800,
                      image: "adventors.png",
                      star: 4,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Adventorss",
                    description: "Pixel is the most featureful phone ever",
                    price: 800,
                    image: "adventors.png",
                    star: 4)),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "ASUS",
                    description: "Laptop is most productive development tool",
                    price: 2000,
                    image: "asus.png",
                    star: 3,
                  ),
                ));
              },
              child: ProductBox(
                  name: "ASUS",
                  description: "Laptop is most productive development tool",
                  price: 2000,
                  image: "asus.png",
                  star: 3),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "MAcbook",
                    description: "Laptop is most productive development tool",
                    price: 1500,
                    image: "macbook_air.png",
                    star: 3,
                  ),
                ));
              },
              child: ProductBox(
                  name: "MAcbook",
                  description:"Laptop is the most useful device ever for meeting",
                  price: 1500,
                  image: "macbook_air.png",
                  star: 3),
            ),
            new GestureDetector(
            onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "SamSUng",
                    description: "Laptop is most productive development tool",
                    price: 100,
                    image: "samsung.png",
                    star: 5,
                  ),
                ));
              },
                child: ProductBox(
                name: "SamSUng",
                description: "Pendrive is useful storage medium",
                price: 100,
                image: "samsung.png",
                star: 5,
              ),
            ),
          ],
        ));
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

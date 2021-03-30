import 'package:barcode_scan/barcode_scan.dart';
import 'package:caisse/produit.dart';
import 'package:caisse/scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Firstroute extends StatefulWidget {
  @override
  _FirstrouteState createState() => _FirstrouteState();
}

class _FirstrouteState extends State<Firstroute> {
  String qrCodeResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Ma Caisse'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.login_outlined,
              color: Colors.white,
            ),
            color: Colors.blueAccent,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scan()),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.deepOrange,
                ),
                label: Text('Ajouter un produit'),
                color: Colors.blueAccent,
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prod()),
                  );
                },
                icon: Icon(
                  Icons.shop_sharp,
                  color: Colors.deepOrange,
                ),
                label: Text('Mon Stock'),
                color: Colors.blueAccent,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  String codeScanner =
                      await BarcodeScanner.scan(); //barcode scanner
                  setState(() {
                    qrCodeResult = codeScanner;
                  });
                  SizedBox(
                    height: 40,
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.qr_code_scanner),
                ),
              ),
            ],
          ),
          new GestureDetector(
            child: new Text(qrCodeResult),
            onLongPress: () {
              Clipboard.setData(new ClipboardData(text: qrCodeResult));
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.

          children: <Widget>[
            DrawerHeader(
              child: Container(
                color: Colors.deepOrange,
              ),
            ),
            ListTile(
              title: Text('Aller sur notre site'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('parametre'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:barcode_scan/barcode_scan.dart';
import 'package:caisse/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class caisse extends StatefulWidget {
  @override
  _caisseState createState() => _caisseState();
}

class _caisseState extends State<caisse> {
  TextEditingController idqrcodectrl;
  String qrCodeResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
//----------------SCANNER--------------------------
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
                      color: kPrimaryLightColor,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.qr_code_scanner),
                ),
              ),
            ],
          ),

//-----------------L'ID DU PRODUIT RECUPERER A PARTIR DU CODE QR ------------------------------
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
      ),
    ));
  }
}

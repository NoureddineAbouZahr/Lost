import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lost/services/globals.dart';
import 'package:lost/utils.dart';
import 'package:latlong2/latlong.dart';
import 'package:lost/widgets/lost_button.dart';

class SpecLost extends StatefulWidget {
  const SpecLost({Key? key}) : super(key: key);

  @override
  State<SpecLost> createState() => _SpecLostState();
}

class _SpecLostState extends State<SpecLost> {
  TextEditingController name = new TextEditingController();
  TextEditingController SerialNumber = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController color = new TextEditingController();
  TextEditingController brand = new TextEditingController();
  TextEditingController extraInfo = new TextEditingController();
  TextEditingController locationx = new TextEditingController();
  TextEditingController locationy = new TextEditingController();
  TextEditingController status = new TextEditingController();
  String base64Image = "";
  LatLng point = LatLng(33, 37);

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0)),
                              filled: true,
                              fillColor: Colors.white70,
                              labelText: '',
                              hintText: 'Search'),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ))
            ],
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            LostButton(text: 'Search', onPressed: () => getItem()),
          ],
        ),
      ]),
    );
  }

  getItem() {
    sendToApiGet('items/getItems').then((value) {
      final items = jsonDecode(value.body);
      var filteredItems = [];
      items.forEach((item) {if (item['subid'].isNotEmpty && item['subid'][0]?['_id'].toString() == lastSubCategoryId) {
          filteredItems.add(item);
        }
      });
      print(filteredItems);
    }).catchError(print);
  }
}

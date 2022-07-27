import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lost/utils.dart';
import 'package:lost/widgets/input.dart';
import 'package:lost/widgets/lost_button.dart';

import '../services/globals.dart';
import '../services/services.dart';

class SpecFound extends StatefulWidget {
  const SpecFound({Key? key}) : super(key: key);

  @override
  State<SpecFound> createState() => _SpecFoundState();
}

class _SpecFoundState extends State<SpecFound> {
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
  LatLng point = LatLng(33.5, 35.37);
  List<Placemark>? location = [];

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Column(
            children: const [
              SizedBox(height: 5),
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 40,
                backgroundColor: Colors.transparent,
              )
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
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child:
                          image != null ? Image.file(image!) : Text('no image'),
                    ),
                  ),
                  MaterialButton(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: Color(0xffefd16f)),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text("Pick Image",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                      onPressed: () {
                        pickImage();
                      }),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(children: [
                    LostInput(
                        labelText: 'Name/Type',
                        hintText: "Enter  Name ",
                        controller: name),
                    LostInput(
                        labelText: 'Serial Number',
                        hintText: 'Enter  S.N',
                        controller: SerialNumber),
                    LostInput(
                        labelText: 'Model',
                        hintText: 'Enter  Model',
                        controller: model),
                    LostInput(
                        labelText: 'Color',
                        hintText: 'Enter Color',
                        controller: color),
                    LostInput(
                        labelText: 'Brand',
                        hintText: 'Enter Brand',
                        controller: brand),
                    LostInput(
                        labelText: 'Extra',
                        hintText: 'Extra Information',
                        controller: extraInfo),
                  ]),
                ),
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffefd16f), width: 3)),
                child: Stack(
                  children: [
                    FlutterMap(
                      options:
                          MapOptions(
                              onTap: (tp,p) async{

                                //location = await placemarkFromCoordinates(p.latitude, p.longitude);

                                setState((){
                                  point=p;

                                }
                                );
                              },

                              zoom: 10.0,
                              center: LatLng(33.5, 35.37)
                          ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                          userAgentPackageName: 'com.example.lost',
                        ),
                        MarkerLayerOptions(markers: [
                          Marker(
                              point: point,
                              builder: (ctx) => const Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                              width: 100,
                              height: 100)
                        ])
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Card(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on_outlined),
                                hintText: "Search for Location",
                                contentPadding: EdgeInsets.all(16.0),
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            LostButton(text: 'Post', onPressed: () => postItem()),
          ],
        ),
      ]),
    );
  }

  String extension = '';
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      extension = image.path.split('.').last;

      List<int> imageBytes = imageTemp.readAsBytesSync();

      base64Image = base64Encode(imageBytes);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));

  postItem() {
    final params = {
      "name": name.text,
      "pic": base64Image,
      "SerialNumber": SerialNumber.text,
      "model": model.text,
      "color": color.text,
      "brand": brand.text,
      "extraInfo": extraInfo.text,
      "locationx": point.longitude,
      "locationy": point.latitude,
      "subid": lastSubCategoryId,
      "user": userData['_id'],
      //"_prefixe": extension
    };
    if (name.text != '') {
      Services().login('items/addItem', params).then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      }).catchError(print);
    }
  }
}

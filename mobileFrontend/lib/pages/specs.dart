import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:latlong/latlong.dart';
import 'package:lost/widgets/input.dart';
import 'package:latlong2/latlong.dart';

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

  LatLng point = LatLng(33, 37);

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
                        labelText: 'Type',
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
                        labelText: 'Extra',
                        hintText: 'Extra Information',
                        controller: extraInfo),
                  ]),
                ),
              ],
            ),
            Stack(
              children: [
                FlutterMap(
                  options: MapOptions(zoom: 10.0, center: LatLng(33, 37)),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayerOptions(markers: [
                      Marker(
                          point: LatLng(33, 37),
                          builder: (ctx) => const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                          width: 100,
                          height: 100)
                    ])
                  ],
                )
              ],
            )
          ],
        ),
      ]),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  
}

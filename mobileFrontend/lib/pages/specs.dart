import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SpecFound extends StatefulWidget {
  const SpecFound({Key? key}) : super(key: key);

  @override
  State<SpecFound> createState() => _SpecFoundState();
}

class _SpecFoundState extends State<SpecFound> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            SizedBox(
              height: 30,
            ),
            Column(
              children:  [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),

                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(

                      border: Border.all(
                        color: Colors.grey,

                      ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child:
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: image !=null ? Image.file(image!):Text('no image'),
                  ),),
                MaterialButton(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      side:const BorderSide(width: 2,color: Color(0xffefd16f)),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Text(
                        "Pick Image",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,fontSize: 10
                        )
                    ),
                    onPressed:() {
                      pickImage();

                    }
                ),]),
                SizedBox(height: 20,),




              ],
            ),

          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
}

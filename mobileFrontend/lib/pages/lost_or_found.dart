import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lost/pages/signup.dart';
import '../navbar.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';

class LostFound extends StatelessWidget {
  const LostFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   double width= MediaQuery.of(context).size.width ;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Row(
            children:  [
              Icon(Icons.menu,color: Color(0xddefd16f),
              size: 40,),
          SizedBox(width: 15,),
          SizedBox(
              child: Column(

                children:  [
                  SizedBox(height: 15,),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            SizedBox(height: 50,),
            Image(

              image: const AssetImage('assets/box.jpg'),
            width:width*0.9 ,
            ),
            SizedBox(height: 70,),
            LostButton(text: 'Found Object', onPressed: ()=>{}),
            SizedBox(height: 20,),
            LostButton(text: 'Lost Object', onPressed: ()=>{})

          ],
        ),

      ),
      drawer: const Nav(),
    );
  }
}

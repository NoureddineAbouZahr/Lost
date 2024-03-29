import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lost/pages/speclost.dart';
import 'package:lost/pages/specs.dart';
import '../services/globals.dart';
import '../utils.dart';
import 'package:http/http.dart' as http;
import '../widgets/treeview.dart';

class Cats extends StatefulWidget {
  const Cats(this.type, {Key? key}) : super(key: key);
  final int type;

  @override
  State<Cats> createState() => _CatsState();
}

class _CatsState extends State<Cats> {
  bool catsLoad = false;
  List<TV> tvs = [];

  @override
  Widget build(BuildContext context) {
    if (!catsLoad) {
      getCats().then((a) {
        var cats = jsonDecode(a.body);
        cats.forEach((cat) {
          List<String> currentCatSubs = [];
          cat['subid'].forEach((subcat) => currentCatSubs.add(subcat['name']));

          tvs.add(TV(
            title: cat['name'],
            subs: currentCatSubs,
            onSelect: (name) {
              lastSubCategory = name;
                lastSubCategoryId = cat['subid'].firstWhere(
                  (element) => element['name'].toString() == name)['_id'];
              if (widget.type == 0) {
                switchPage(context, () => SpecFound());
              } else {
                switchPage(context, () => SpecLost());
              }
            },
          ));
        });

        catsLoad = true;
        setState(() => {});
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
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
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(

                  children: tvs,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response> getCats() {
    return sendToApiGet('categories/getCategories');
  }
}

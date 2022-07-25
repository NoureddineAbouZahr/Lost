import 'package:flutter/material.dart';
import 'package:lost/utils.dart';

class TV extends StatefulWidget {
  Function(String name) onSelect;
  String title;

  TV({Key? key, required this.subs, required this.onSelect, required this.title}) : super(key: key);

  List<String> subs;
  @override
  State<TV> createState() => _TreeViewState();
}

class _TreeViewState extends State<TV> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {

    return ExpansionPanelList(
      animationDuration: Duration(milliseconds: 100),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(widget.title, style: TextStyle(color: Colors.black),),
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.subs.map((currentTile) =>
                ListTile(
                  leading: Icon(Icons.circle),
                  title: Text(currentTile),
                  onTap: () => widget.onSelect(currentTile),
              )).toList(),
          ),
          isExpanded: _expanded,
          canTapOnHeader: true,
        ),
      ],
      dividerColor: Colors.grey,
      expansionCallback: (panelIndex, isExpanded) {
        _expanded = !_expanded;
        setState(() {

        });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomSearchBar extends StatefulWidget {

  final Function(String query) updateSearchQuery;

  const CustomSearchBar({Key key, this.updateSearchQuery}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  TextEditingController _searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.grey[400])
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              controller: _searchQueryController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search product",
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (query) => widget.updateSearchQuery(query),
            ),
          ),
          IconButton(icon: Icon(MdiIcons.close), onPressed: (){
            _searchQueryController.clear();
            widget.updateSearchQuery("");
          }),
        ],
      )
    );
  }
}
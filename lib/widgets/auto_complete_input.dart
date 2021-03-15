import 'package:flutter/material.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';
import 'package:auto_complete_search/auto_complete_search.dart';

class AutoCompleteInput extends StatefulWidget {
  final List<String> _items;
  final TextEditingController _controller;
  final String hintText;
  final String helpertext;
  final Icon icon;
  AutoCompleteInput(this._items, this._controller,
      {this.hintText, this.helpertext, this.icon, Key key})
      : super(key: key);
  @override
  _AutoCompleteInputState createState() => _AutoCompleteInputState();
}

class _AutoCompleteInputState extends State<AutoCompleteInput> {
  // GlobalKey key = new GlobalKey<AutoCompleteSearchFieldState<List<String>>>();
  // List<Area> areas = [];

  @override
  void initState() {
    // List<Area> areas = widget.areaList
    //     .map((area) => Area(name: area["name"], id: area["id"]))
    //     .toList();
    // Area.areas = areas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoCompleteSearchField(
      // key: key,
      // onFocusChanged: ,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff6A4E77),
            width: 5,
          ),
        ),
        hintText: (widget.hintText != null) ? widget.hintText : "",
        helperText: (widget.helpertext != null) ? widget.helpertext : "",
        icon: (widget.icon != null) ? widget.icon : null,
        // border: InputBorder(),
      ),
      controller: widget._controller,
      submitOnSuggestionTap: true,
      itemSorter: (String a, String b) =>
          a.toLowerCase().compareTo(b.toLowerCase()),
      suggestions: widget._items,
      itemSubmitted: (String value) {
        setState(() {
          widget._controller.text = value;
        });
      },
      suggestionsDirection: SuggestionsDirection.down,
      suggestionWidgetSize: 50.0,
      itemBuilder: (context, suggestion) => new Padding(
          child: new ListTile(
            leading: new SubtitleText(suggestion),
            // title: new SubtitleText(suggestion),
          ),
          padding: const EdgeInsets.all(4.0)),
      itemFilter: (suggestion, input) =>
          suggestion.toLowerCase().contains(input.toLowerCase()),
      clearOnSubmit: false,
    );
  }
}

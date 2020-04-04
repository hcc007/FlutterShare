import 'package:flutter/material.dart';

class CountriesField extends StatefulWidget {
  @override
  _CountriesFieldState createState() => _CountriesFieldState();
}

class _CountriesFieldState extends State<CountriesField> {

  final FocusNode _focusNode = FocusNode();

  OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  TextEditingController controller;

  @override
  void initState() {

    controller = new TextEditingController();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {

        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);

      } else {
        this._overlayEntry.remove();
      }
    });
  }


  @override
  void dispose() {
    this._overlayEntry.remove();
    super.dispose();
  }



  OverlayEntry _createOverlayEntry() {

    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: this._layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height + 5.0),
            child: Material(
              elevation: 4.0,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Text('中国'),
                    onTap: () {
                      controller.text = "中国";
                      this._overlayEntry.remove();
                      setState(() {

                      });
                    },
                  ),
                  ListTile(
                    title: Text('美国'),
                    onTap: () {
                      controller.text = "美国";
                      this._overlayEntry.remove();
                      setState(() {

                      });
                    },
                  )
                ],
              ),
            ),
          ),
        )
    );


  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextFormField(
        focusNode: this._focusNode,
        controller:controller ,
        decoration: InputDecoration(
            labelText: 'Country'
        ),
      ),
    );
  }
}
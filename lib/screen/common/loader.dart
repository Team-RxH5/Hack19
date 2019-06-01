import 'package:flutter/material.dart';

class Loader extends StatelessWidget {

  final bool expanded;

  Loader(this.expanded);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          _loadItem(),
          Opacity(
            opacity: 0.75,
            child: _loadItem(),
          ),
          Opacity(
            opacity: 0.5,
            child: _loadItem(),
          ),
        ],
      ),
    );
  }

  Widget _loadItem() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            expanded ? SizedBox(height: 200,) : Container(),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 24,
                color: Colors.black12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 20,
                width: 120,
                color: Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

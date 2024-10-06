import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    this.numColumns = 2,
    required this.children,
    this.spacingHorizontal = 10,
    this.spacingVertical = 10,
  });
  final int numColumns;
  final double spacingHorizontal;
  final double spacingVertical;
  final List<Widget> children;

  Widget space() => SizedBox(width: spacingHorizontal, height: spacingVertical);

  List<Widget> rows(List<Widget> children) {
    final List<Widget> rows = [];
    final numRows = (children.length / numColumns).ceil();
    for (int i = 0; i < numRows; i++) {
      List<Widget> rowW = [];
      for (int j = 0; j < numColumns; j++) {
        final index = i * numColumns + j;
        if (index >= children.length) {
          rowW.add(const Expanded(child: SizedBox()));
          continue;
        }
        rowW.add(Expanded(child: children[i * numColumns + j]));
        if (j != numColumns - 1) rowW.add(space());
      }
      rows.add(Row(children: rowW));
      if (i != numRows - 1) rows.add(space());
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rows(children),
    );
  }
}

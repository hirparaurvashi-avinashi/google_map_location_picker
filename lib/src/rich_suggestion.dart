import 'package:flutter/material.dart';

import 'model/auto_comp_iete_item.dart';

class RichSuggestion extends StatelessWidget {
  final VoidCallback onTap;
  final AutoCompleteItem autoCompleteItem;

  RichSuggestion(this.autoCompleteItem, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: TextSpan(children: getStyledTexts(context)),
                  ),
                )
              ],
            )),
        onTap: onTap,
      ),
    );
  }

  List<TextSpan> getStyledTexts(BuildContext context) {
    final List<TextSpan> result = [];

    String startText =
        autoCompleteItem.text.substring(0, autoCompleteItem.offset);
    if (startText.isNotEmpty) {
      result.add(
        TextSpan(
          text: startText,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      );
    }

    String boldText = autoCompleteItem.text.substring(autoCompleteItem.offset,
        autoCompleteItem.offset + autoCompleteItem.length);

    result.add(TextSpan(
      text: boldText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
    ));

    String remainingText = this
        .autoCompleteItem
        .text
        .substring(autoCompleteItem.offset + autoCompleteItem.length);
    result.add(
      TextSpan(
        text: remainingText,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );

    return result;
  }
}

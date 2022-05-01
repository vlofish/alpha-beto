import 'package:flutter/material.dart';

import 'enums.dart';

class CardWidget extends StatelessWidget {
  final CardType cardType;
  final String cardInfo; // Either the text or the url of the image to display.

  const CardWidget({Key? key, required this.cardType, required this.cardInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }

  Widget _buildWidget() {
    Widget childrenWidget;

    if (cardType == CardType.text) {
      childrenWidget = Center(child: _legoTextWidget());
    } else {
      childrenWidget = Center(child: _legoImgWidget());
    }

    return _legoCardWidget(childrenWidget);
  }

  Widget _legoCardWidget(Widget childrenWidget) {
    return Card(
      child: InkWell(
        splashColor: Colors.orange.withAlpha(30),
        onTap: () {
          // cardFunction(cardSoundId);
        },
        child: SizedBox(
          width: cardType == CardType.text ? 300 : null,
          height: cardType == CardType.text ? 90 : null,
          child: childrenWidget,
        ),
      ),
    );
  }

  Widget _legoTextWidget() {
    double fontSize80 =
        80; // TODO: the fontSize must change according to the device.

    return Text(
      cardInfo,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize80),
      textAlign: TextAlign.center,
    );
  }

  Widget _legoImgWidget() {
    return Container();
    // return const Image(
    //   image: AssetImage(''),
    //   height: 250,
    //   semanticLabel: 'TODO: add the name of the displayed image.',
    // );
  }
}

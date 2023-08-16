import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

enum Shape { rectangle, circular, none }

class TextAvatar extends StatelessWidget {
  final Shape? shape;
  final Color? backgroundColor;
  final Color? textColor;
  final double size;
  final String? text;
  final bool? upperCase;
  final String? urlAvatar;
  final TextStyle? textStyle;

  const TextAvatar({
    Key? key,
    required this.text,
    this.textColor = AppColors.textPrimary,
    this.backgroundColor,
    this.size = 48,
    this.textStyle,
    this.urlAvatar,
    this.shape = Shape.circular,
    this.upperCase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: _buildTextType(),
      color: backgroundColor ??
          colorData[_textConfiguration()[0].toLowerCase().toString()],
      child: (urlAvatar?.isNotEmpty ?? false)
          ? CachedNetworkImage(
              cacheKey: ValueNotifier(urlAvatar).value,
              imageUrl: urlAvatar ?? '',
              placeholder: (context, url) => CircleAvatar(
                  backgroundColor: Colors.transparent, radius: (size / 2)),
              errorWidget: (context, url, error) => const Icon(Icons.image),
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: (size / 2),
                  backgroundImage: imageProvider,
                );
              },
            )
          : CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: (size / 2),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _textConfiguration(),
                    style:
                        (textStyle ?? AppTextStyles.aBeeZeeRegular16).copyWith(
                      color: textColor,
                      fontSize: (size ~/ 3).toDouble(),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  String _toString({String? value}) {
    return String.fromCharCodes(
      value!.runes.toList(),
    );
  }

  String _textConfiguration() {
    var newText =
        (text == null || text?.trim() == '') ? '?' : _toString(value: text);
    newText = upperCase! ? newText.toUpperCase() : newText;
    var arrayLeeters = newText.trim().split(' ');

    var i = 0;
    var result = '';

    var lenght = arrayLeeters.length < 4 ? arrayLeeters.length : 3;
    while (i < lenght) {
      result += arrayLeeters[i][0].trim();
      i++;
    }

    return result;
  }

  _buildTextType() {
    switch (shape) {
      case Shape.rectangle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        );
      case Shape.circular:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((size / 2)),
        );
      case Shape.none:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        );
      default:
        {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((size / 2)),
          );
        }
    }
  }
}

var colorData = const {
  'a': Color.fromRGBO(226, 95, 81, 1),
  'b': Color.fromRGBO(242, 96, 145, 1),
  'c': Color.fromRGBO(187, 101, 202, 1),
  'd': Color.fromRGBO(149, 114, 207, 1),
  'e': Color.fromRGBO(120, 132, 205, 1),
  'f': Color.fromRGBO(91, 149, 249, 1),
  'g': Color.fromRGBO(72, 194, 249, 1),
  'h': Color.fromRGBO(69, 208, 226, 1),
  'i': Color.fromRGBO(38, 166, 154, 1),
  'j': Color.fromRGBO(82, 188, 137, 1),
  'k': Color.fromRGBO(155, 206, 95, 1),
  'l': Color.fromRGBO(212, 227, 74, 1),
  'm': Color.fromRGBO(254, 218, 16, 1),
  'n': Color.fromRGBO(247, 192, 0, 1),
  'o': Color.fromRGBO(255, 168, 0, 1),
  'p': Color.fromRGBO(255, 138, 96, 1),
  'q': Color.fromRGBO(194, 194, 194, 1),
  'r': Color.fromRGBO(143, 164, 175, 1),
  's': Color.fromRGBO(162, 136, 126, 1),
  't': Color.fromRGBO(163, 163, 163, 1),
  'u': Color.fromRGBO(175, 181, 226, 1),
  'v': Color.fromRGBO(179, 155, 221, 1),
  'w': Color.fromRGBO(194, 194, 194, 1),
  'x': Color.fromRGBO(124, 222, 235, 1),
  'y': Color.fromRGBO(188, 170, 164, 1),
  'z': Color.fromRGBO(173, 214, 125, 1),
};

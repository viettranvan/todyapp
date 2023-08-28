import 'package:todyapp/pages/conversation/widgets/index.dart';

extension ContentTypeExtension on int {
  ChatContentType get getContentType {
    switch (this) {
      case 0:
        return ChatContentType.text;
      case 1:
        return ChatContentType.sticker;
      case 2:
        return ChatContentType.image;
      default:
        return ChatContentType.text;
    }
  }
}

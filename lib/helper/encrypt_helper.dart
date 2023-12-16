import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  static late final iv;
  static late final Encrypter encrypter;
  static init() {
    try {
      iv = IV.fromLength(16);
      encrypter = Encrypter(AES(
        Key.fromUtf8('H4WtkvK4qyehIe2kjQfH7we1xIHFK67e'),
      ));
    } catch (error) {
      print("error init>> $error");
    }
  }

  static dynamic encryptMessage(dynamic message) {
    if (message.runtimeType == String) {
      final encrypted = encrypter.encrypt(message, iv: iv).base64;
      return encrypted;
    }
    return message;
  }

  static String? decryptMessage(String? encryptedMessage) {
    if (encryptedMessage != null) {
      try {
        final encrypted = Encrypted.fromBase64(encryptedMessage);
        final decrypted = encrypter.decrypt(encrypted, iv: iv);
        return decrypted;
      } catch (error) {
        print("error decryptMessage>> $error");
        return encryptedMessage;
      }
    }
    return null;
  }
}

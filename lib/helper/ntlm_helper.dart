import 'dart:convert';
import 'package:http/http.dart';
import 'package:ntlm/ntlm.dart';
import 'encrypt_helper.dart';

class NLTMAuthServices {
  static var client = NTLMClient(
    domain: EncryptionHelper.decryptMessage("private data").toString(),
    username: EncryptionHelper.decryptMessage("private data").toString(),
    password: EncryptionHelper.decryptMessage("private data").toString(),
  );

  static decodeResponse({required Response response}) async {
    var decodeResponse =
        await jsonDecode(response.body) as Map<String, dynamic>;
    return decodeResponse;
  }
}

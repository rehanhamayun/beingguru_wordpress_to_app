import 'dart:convert';

import 'package:http/http.dart' as http;

class BeingGuruImages {
  var urlimgaes = "";

  fetchImages() async {
    var imgresponse = await http.get(Uri.parse(urlimgaes));
    Map<String, dynamic> finalImages = await json.decode(imgresponse.body);
    return finalImages;
  }
}

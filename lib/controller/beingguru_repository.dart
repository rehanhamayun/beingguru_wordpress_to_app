import 'dart:convert';

import 'package:http/http.dart' as http;

class BeingGuru {
  var url = "https://beingguru.com/wp-json/wp/v2/posts?_embed";

  fetchBlogsData() async {
    var respone = await http.get(Uri.parse(url));
    var finalResponse = await json.decode(respone.body);

    return finalResponse;
  }
}

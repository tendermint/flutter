import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starport_template/app_config.dart';

class NodeInfoLoader {
  NodeInfoLoader(this.appConfig);

  AppConfig appConfig;

  Future<String> getChainId() async {
    final uri = '${appConfig.baseApiUrl}/node_info';
    final response = await http.get(Uri.parse(uri));
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    if (map['node_info'] == null) {
      return '';
    }

    return (map['node_info'] as Map<String, dynamic>)['network'] as String;
  }
}

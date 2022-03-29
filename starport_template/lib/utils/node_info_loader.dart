import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starport_template/utils/env_util.dart';

class NodeInfoLoader {
  NodeInfoLoader(this.baseEnv);

  BaseEnvUtil baseEnv;

  Future<String> getChainId() async {
    final uri = '${baseEnv.baseApiUrl}/node_info';
    final response = await http.get(Uri.parse(uri));
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    if (map['node_info'] == null) {
      return '';
    }

    return (map['node_info'] as Map<String, dynamic>)['network'] as String;
  }
}

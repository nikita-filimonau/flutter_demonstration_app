import 'package:demonstration_project/screens/login/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:demonstration_project/utils/navigation_util.dart';

enum ServerType { user, data }

enum RequestType { GET, POST, PUT, PATH }

mixin HttpUtil {
  static const _mainApiData = 'sandbox-data-api.compliance.ai';
  static const _mainApiUser = 'api-integration.compliance.ai';
  static const _tokenName = 'token';
  static const Map<String, String> _defaultParams = {};
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static String getMainUrl(ServerType? type) {
    String mainUrl;
    if (type == ServerType.user) {
      mainUrl = _mainApiUser;
    } else {
      mainUrl = _mainApiData;
    }
    return mainUrl;
  }

  Future setToken(String token) async {
    return _prefs.then((SharedPreferences prefs) {
      return (prefs.setString(_tokenName, token));
    });
  }

  Future<String?> getToken() async {
    return _prefs.then((SharedPreferences prefs) {
      return (prefs.getString(_tokenName));
    });
  }

  Future removeToken() async {
    return _prefs.then((SharedPreferences prefs) {
      return (prefs.remove(_tokenName));
    });
  }

  Future<Map<String, String>?> getHeader() async {
    String? value = await getToken();
    Map<String, String>? header;
    if (value != null && value is String) {
      header = {'authorization': value};
    }
    return header;
  }

  Future requestByType({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? header,
    required bool jsonBody,
    Map? body,
  }) async {
    final request;
    if (requestType == RequestType.POST) {
      request = http.post(
        uri,
        body: jsonBody ? json.encode(body) : body,
        headers: header,
      );
    } else if (requestType == RequestType.PUT) {
      request = http.put(
        uri,
        body: json.encode(body),
        headers: header,
      );
    } else {
      request = http.get(
        uri,
        headers: header,
      );
    }
    return request;
  }

  Future request({
    ServerType? type,
    required RequestType requestType,
    required String path,
    Map<String, String> params = _defaultParams,
    bool redirect = true,
    bool jsonBody = true,
    Map? body,
  }) async {
    String mainUrl = getMainUrl(type);
    Uri uri = Uri.https(mainUrl, path, params);
    Map<String, String>? header = await getHeader();
    return await requestByType(
      requestType: requestType,
      uri: uri,
      header: header,
      jsonBody: jsonBody,
      body: body,
    ).then((resp) => checkResponse(response: resp, redirect: redirect));
  }

  dynamic checkResponse({
    required http.Response response,
    bool redirect = true,
  }) {
    int code = response.statusCode;
    if (code == 204) {
      print('Empty body.');
      return null;
    } else if (code == 401 && redirect) {
      NavigationService.instance.navigateTo(LoginScreen.routeName);
    } else if (code >= 400) {
      print('Something wrong on backend.');
      return null;
    } else if (code >= 200) {
      String data = response.body;
      var decoded;
      try {
        decoded = jsonDecode(data);
      } catch (e) {
        print(e);
        decoded = {};
      }
      return decoded;
    }
  }
}

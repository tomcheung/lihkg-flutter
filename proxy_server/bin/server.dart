import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:args/args.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

// For Google Cloud Run, set _hostname to '0.0.0.0'.
const _hostname = 'localhost';

void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    // 64: command line usage error
    exitCode = 64;
    return;
  }

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);

  var server = await io.serve(handler, _hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}

Future<shelf.Response> _echoRequest(shelf.Request request) async {
  print('Request ${request.method} ${request.url}');

  if (request.method == 'OPTIONS') {
    print('Sending CORS response');

    return shelf.Response.ok('{"msg": "ok"}', headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, User-Agent, X-LI-DEVICE, X-LI-DEVICE-TYPE, Accept',
      'Content-Type': 'application/json;charset=utf-8'
    });
  }
  var uri = request.url;
  uri = uri.replace(host: 'lihkg.com', scheme: 'https');

  var requestHeader = {
    'User-Agent': 'LIHKG/3.10 iOS/14.5 iPhone/iPhone13,4',
		'X-LI-DEVICE': request.headers['X-LI-DEVICE'] ?? '38735b3df9084f658a4fe7d8ab70bd1567c41035',
		'X-LI-DEVICE-TYPE': 'iPhone13,4',
		'Host': 'lihkg.com'
  };

  var cookie = request.headers['Cookie'];
  if (cookie != null) {
    requestHeader['Cookie'] = cookie;
  }

  print('============ Sending request: ============');
  print('headers: $requestHeader');
  print('uri: $uri');
  print('==========================================');

  var response = await http.get(uri, headers: requestHeader);

  var body = response.body;

  var headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, User-Agent, X-LI-DEVICE, X-LI-DEVICE-TYPE, Accept'
  };

  response.headers.forEach((key, value) {
    if (['alt-svc', 'set-cookie', 'content-type'].contains(key.toLowerCase())) {
      headers[key.toString()] = value.toString();
      print('update header $key $value');
    }
  });

  print('============ Response: ============');
  print('headers: ${response.statusCode}');
  print('headers: ${response.headers}');
  print('body: ${response.body}');
  print('===================================');

  return shelf.Response.ok(
    body,
    encoding: utf8,
    headers: headers
  );
}
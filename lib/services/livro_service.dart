import 'dart:convert';
import 'dart:io';

import 'package:app_livraria_flutter/models/livro.dart';
import 'package:app_livraria_flutter/services/webclient.dart';
import 'package:http/http.dart' as http;

class LivroService {
  String url = WebClient.url;
  http.Client client = WebClient().client;
  static const String resource = "livros";

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Livro livro) async {
    String jsonLivro = json.encode(livro.toMap());

    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {'Content-type': 'application/json'},
      body: jsonLivro,
    );

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }
    return true;
  }

  Future<bool> edit(String id, Livro livro) async {
    String jsonLivro = json.encode(livro.toMap());

    http.Response response = await client.put(
      Uri.parse("${getUrl()}$id"),
      headers: {'Content-type': 'application/json'},
      body: jsonLivro,
    );

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }
    return true;
  }

  Future<bool> delete(String id) async {
    http.Response response = await client.delete(
      Uri.parse("${getUrl()}$id"),
    );

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }
    return true;
  }

  Future<List<Livro>> getAll() async {
    http.Response response = await client.get(
      Uri.parse(getUrl()),
    );

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }

    List<Livro> list = [];

    List<dynamic> listDynamic = json.decode(response.body);

    for (var jsonMap in listDynamic) {
      list.add(Livro.fromMap(jsonMap));
    }

    return list;
  }

  // Future<Livro> getByID(String id) async {
  //   http.Response response = await client.get(
  //     Uri.parse("${getUrl()}$id"),
  //   );

  //   if (response.statusCode != 200) {
  //     throw HttpException(response.body);
  //   }
  //   return true;
  // }
}

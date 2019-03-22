//import 'mock_heroes.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'hero.dart';

class HeroService {
  /*Future<List<Hero>> getAll() async => mockHeroes;

  Future<Hero> get(int id) async => (await getAll()).firstWhere((hero) => hero.id == id);*/

  static const _heroesUrl = 'api/heroes'; //URL to web API

  final Client _http;

  HeroService(this._http);

  Future<List<Hero>> getAll() async {
    try {
      final response =await _http.get(_heroesUrl);
      final heroes = (_extractData(response) as List)
        .map((json) => Hero.fromJson(json)).toList();
      return heroes;
    } catch(e){
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e){
    print(e); //for demo purposes only
    return Exception('Server error; cause: $e');
  }
}
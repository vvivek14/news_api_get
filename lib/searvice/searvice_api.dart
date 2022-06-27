import 'package:dio/dio.dart';
import 'package:news/models/newsrenspons.dart';

class NewsApi {
  static String _apiKey = "2BdzDKU9mCj1uXwdO0CD5Yvb4IlahN4suMtXU9Ig3ek";
  String _url = "https://api.newscatcherapi.com/v2/search?q=Tesla";
  late Dio _dio;

  NewsApi() {
    _dio = Dio();
  }

  Future<List<Articles>?> fetchnewsArticle() async {
    try {
      Response response = await _dio.get(_url,
          options: Options(headers: {"x-api-key": _apiKey}));
      NewResponse newResponse = NewResponse.fromJson(response.data);
      return newResponse.articles;
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Config/ApiConfig.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> searchNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> apple5News = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> tesla5News = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> business5News = <NewsModel>[].obs;
  RxBool isTrandingLoading = false.obs;
  RxBool isNewsForULoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isBuisLoading = false.obs;
  RxBool isSpeeking = false.obs;

  final FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() async {
    super.onInit();
    getNewsForYou();
    getTrandingNews();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }

  Future<void> getTrandingNews() async {
    isTrandingLoading.value = true;
    var baseURL = ApiConfig.getTrendingNewsUrl();
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["status"] == "ok" && body["articles"] != null) {
          var articals = body["articles"];
          trandingNewsList.clear();
          for (var news in articals) {
            trandingNewsList.add(NewsModel.fromJson(news));
          }
        }
      } else if (response.statusCode == 401) {
        _showApiKeyError();
      }
    } catch (ex) {
      // Handle error silently
    }
    isTrandingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForULoading.value = true;
    var baseURL = ApiConfig.getNewsForYouUrl();
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["status"] == "ok" && body["articles"] != null) {
          var articals = body["articles"];
          newsForYouList.clear();
          for (var news in articals) {
            newsForYouList.add(NewsModel.fromJson(news));
          }
          if (newsForYouList.length >= 5) {
            newsForYou5.value = newsForYouList.sublist(0, 5).obs;
          }
        }
      }
    } catch (ex) {
      // Handle error silently
    }
    isNewsForULoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleLoading.value = true;
    final today = DateTime.now();
    final sevenDaysAgo = today.subtract(const Duration(days: 7));
    final fromDate = sevenDaysAgo.toIso8601String().split('T')[0];
    var baseURL = ApiConfig.getAppleNewsUrl(fromDate);
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["status"] == "ok" && body["articles"] != null) {
          var articals = body["articles"];
          appleNewsList.clear();
          for (var news in articals) {
            appleNewsList.add(NewsModel.fromJson(news));
          }
          if (appleNewsList.length >= 5) {
            apple5News.value = appleNewsList.sublist(0, 5).obs;
          }
        }
      }
    } catch (ex) {
      // Handle error silently
    }
    isAppleLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    isTeslaLoading.value = true;
    final today = DateTime.now();
    final sevenDaysAgo = today.subtract(const Duration(days: 7));
    final fromDate = sevenDaysAgo.toIso8601String().split('T')[0];
    var baseURL = ApiConfig.getTeslaNewsUrl(fromDate);
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["status"] == "ok" && body["articles"] != null) {
          var articals = body["articles"];
          teslaNewsList.clear();
          for (var news in articals) {
            teslaNewsList.add(NewsModel.fromJson(news));
          }
          if (teslaNewsList.length >= 5) {
            tesla5News.value = teslaNewsList.sublist(0, 5).obs;
          }
        }
      }
    } catch (ex) {
      // Handle error silently
    }
    isTeslaLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBuisLoading.value = true;
    var baseURL = ApiConfig.getBusinessNewsUrl();
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["status"] == "ok" && body["articles"] != null) {
          var articals = body["articles"];
          businessNewsList.clear();
          for (var news in articals) {
            businessNewsList.add(NewsModel.fromJson(news));
          }
          if (businessNewsList.length >= 5) {
            business5News.value = businessNewsList.sublist(0, 5).obs;
          }
        }
      }
    } catch (ex) {
      // Handle error silently
    }
    isBuisLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsForULoading.value = true;
    var baseURL = ApiConfig.getSearchNewsUrl(search);
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["status"] == "ok" && body["articles"] != null) {
          var articals = body["articles"];
          newsForYouList.clear();
          int i = 0;
          for (var news in articals) {
            i++;
            newsForYouList.add(NewsModel.fromJson(news));
            if (i == 10) {
              break;
            }
          }
        }
      }
    } catch (ex) {
      // Handle error silently
    }
    isNewsForULoading.value = false;
  }

  Future<void> speak(String text) async {
    try {
      isSpeeking.value = true;
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);

      flutterTts.setCompletionHandler(() {
        isSpeeking.value = false;
      });

      await flutterTts.speak(text);
    } catch (e) {
      isSpeeking.value = false;
    }
  }

  void stop() async {
    try {
      await flutterTts.stop();
      isSpeeking.value = false;
    } catch (e) {
      isSpeeking.value = false;
    }
  }

  void _showApiKeyError() {
    Get.snackbar(
      '⚠️ API Key Required',
      'Please add your NewsAPI key in lib/Config/ApiConfig.dart\nGet free key: newsapi.org/register',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      backgroundColor: Get.theme.colorScheme.errorContainer,
      colorText: Get.theme.colorScheme.onErrorContainer,
    );
  }
}

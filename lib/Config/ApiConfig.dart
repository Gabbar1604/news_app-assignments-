class ApiConfig {
  // Replace this with your actual NewsAPI key
  static const String newsApiKey = "4c055c20dea04214843ee3e03d514c2d";

  // API Endpoints
  static const String baseUrl = "https://newsapi.org/v2";

  // Top Headlines
  static String getTrendingNewsUrl() =>
      "$baseUrl/top-headlines?sources=techcrunch&apiKey=$newsApiKey";

  static String getNewsForYouUrl() =>
      "$baseUrl/top-headlines?country=us&category=general&apiKey=$newsApiKey";

  static String getBusinessNewsUrl() =>
      "$baseUrl/top-headlines?country=us&category=business&apiKey=$newsApiKey";

  // Everything endpoint with date
  static String getAppleNewsUrl(String fromDate) =>
      "$baseUrl/everything?q=apple&from=$fromDate&sortBy=popularity&apiKey=$newsApiKey";

  static String getTeslaNewsUrl(String fromDate) =>
      "$baseUrl/everything?q=tesla&from=$fromDate&sortBy=publishedAt&apiKey=$newsApiKey";

  static String getSearchNewsUrl(String query) =>
      "$baseUrl/everything?q=$query&apiKey=$newsApiKey";
}

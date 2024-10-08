/// Berisi kopnfigurasi aplikasi
mixin AppConfig {
  /// Nama rumah sakit di dalam aplikasi
  static String appName = 'todoList';

  /// Url utama pada saat request data ke API GCP
  static const String _baseUrl = 'http://94.74.86.174:8080/api/';

  /// Branding menggunakan HiSys atau Teramedik
  static bool isHisys = false;

  /// Durasi ketika pull refresh data dalam milliseconds
  static const int refreshDataDuration = 800;

  static String baseUrl() {
    const buildMode = String.fromEnvironment('BUILD_MODE', defaultValue: 'DEV');
    final Map<String, String> urlMap = {
      'DEV': _baseUrl,
    };

    return urlMap[buildMode] ?? _baseUrl;
  }
}

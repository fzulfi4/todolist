class SignInModel {
  final int statusCode;
  final String message;
  final String? errorMessage; // Nullable since it can be null
  final Data? data; // Nested model

  SignInModel({
    required this.statusCode,
    required this.message,
    this.errorMessage,
    this.data,
  });

  // Factory constructor to create an instance from JSON
  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data: json['data'] != null
          ? Data.fromJson(json['data'])
          : null, // Handle nested data
    );
  }

  // Method to convert the class back to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'errorMessage': errorMessage,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final String token;

  Data({
    required this.token,
  });

  // Factory constructor to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
    );
  }

  // Method to convert the class back to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

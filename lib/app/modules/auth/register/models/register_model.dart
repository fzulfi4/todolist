class RegisterModel {
  final int statusCode;
  final String message;
  final String errorMessage;
  final dynamic
      data; // Use dynamic or Object, depending on the expected structure of "data"

  RegisterModel({
    required this.statusCode,
    required this.message,
    required this.errorMessage,
    this.data,
  });

  // Factory constructor to create an instance from JSON
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data: json['data'],
    );
  }

  // Method to convert the class back to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'errorMessage': errorMessage,
      'data': data,
    };
  }
}

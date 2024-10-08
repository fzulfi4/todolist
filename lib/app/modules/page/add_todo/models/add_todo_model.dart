class AddTodoModel {
  final int statusCode;
  final String message;
  final String? errorMessage; // Nullable because it can be null
  final Data? data; // Single Data object, not a list

  AddTodoModel({
    required this.statusCode,
    required this.message,
    this.errorMessage,
    this.data,
  });

  // Factory constructor to create an instance from JSON
  factory AddTodoModel.fromJson(Map<String, dynamic> json) {
    return AddTodoModel(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
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
  final int id;
  final String name;
  final dynamic items; // Can be null, or an array or object
  final bool checklistCompletionStatus;

  Data({
    required this.id,
    required this.name,
    this.items,
    required this.checklistCompletionStatus,
  });

  // Factory constructor to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      items: json['items'], // Can be null or any type
      checklistCompletionStatus: json['checklistCompletionStatus'],
    );
  }

  // Method to convert the class back to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'items': items,
      'checklistCompletionStatus': checklistCompletionStatus,
    };
  }
}

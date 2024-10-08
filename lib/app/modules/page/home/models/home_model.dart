class HomeModel {
  final int statusCode;
  final String message;
  final String? errorMessage; // Nullable because it can be null
  final List<Item>? data; // List of Item objects

  HomeModel({
    required this.statusCode,
    required this.message,
    this.errorMessage,
    this.data,
  });

  // Factory constructor to create an instance from JSON
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data: json['data'] != null
          ? List<Item>.from(json['data'].map((x) => Item.fromJson(x)))
          : null, // Parse the list of Item if data is not null
    );
  }

  // Method to convert the class back to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'errorMessage': errorMessage,
      'data': data != null
          ? List<dynamic>.from(data!.map((x) => x.toJson()))
          : null,
    };
  }
}

class Item {
  final int id;
  final String? name;
  final dynamic items; // Items can be null, or an array or object
  final bool checklistCompletionStatus;

  Item({
    required this.id,
    this.name,
    this.items,
    required this.checklistCompletionStatus,
  });

  // Factory constructor to create an instance from JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      items: json['items'], // This can be null or an object/array
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

class SignEmailModel {
  SignEmailModel({
    this.email,
    this.timeLoginAgain,
    this.login,
  });

  String? email;
  DateTime? timeLoginAgain;
  int? login;

  factory SignEmailModel.fromJson(Map<String, dynamic> json) => SignEmailModel(
        email: json['email'],
        timeLoginAgain: json['timeLoginAgain'],
        login: json['login'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'timeLoginAgain': timeLoginAgain,
        'login': login,
      };
}

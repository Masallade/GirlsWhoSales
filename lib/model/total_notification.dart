class TotalNotification {
  String totalCountNotf;

  TotalNotification({this.totalCountNotf});

  TotalNotification.fromJson(Map<String, dynamic> json) {
    totalCountNotf = json['total_count_notf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count_notf'] = this.totalCountNotf;
    return data;
  }
}
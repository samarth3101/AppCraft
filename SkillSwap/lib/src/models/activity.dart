class Activity {
  final String title;
  final String description;
  final DateTime timestamp;

  Activity({required this.title, required this.description, required this.timestamp});

  // Factory constructor to create Activity from JSON (if needed for network requests)
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      title: json['title'],
      description: json['description'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Convert Activity object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
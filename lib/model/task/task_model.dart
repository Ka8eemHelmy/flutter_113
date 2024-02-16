class TaskModel {
  Data? data;
  String? message;
  int? status;
  List? error;

  TaskModel({
    this.data,
    this.message,
    this.status,
    this.error,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = Data.fromJson(json['data']);
    }
    message = json['message'];
    status = json['status'];
    error = json['error'];
  }
}

class Data {
  List<Task>? tasks = [];
  Meta? meta;

  Data({
    this.tasks,
    this.meta,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      for (var i in json['tasks']) {
        tasks?.add(Task.fromJson(i));
      }
    }
    if (json['meta'] != null) {
      meta = Meta.fromJson(json['meta']);
    }
  }
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'per_page': perPage,
      'current_page': currentPage,
      'last_page': lastPage,
    };
  }
}

class Task {
  int? id;
  String? title;
  String? description;
  String? image;
  String? startDate;
  String? endDate;
  String? status;

  Task({
    this.id,
    this.title,
    this.description,
    this.image,
    this.startDate,
    this.endDate,
    this.status,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id' : id,
      'title': title,
      if (description != null) 'description': description,
      // 'image' : image,
      'start_date': startDate,
      'end_date': endDate,
      if (status != null) 'status': status,
    };
  }
}

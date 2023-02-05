// ignore_for_file: file_names


class DetailModal {
  DetailModal({
    this.code,
    this.meta,
    this.data,
  });

  DetailModal.fromJson(dynamic json) {
    code = json['code'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? code;
  Meta? meta;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Meta {
  Meta({
    this.pagination,
  });

  Meta.fromJson(dynamic json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }
  Pagination? pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    return map;
  }
}

class Pagination {
  Pagination({
    this.total,
    this.pages,
    this.page,
    this.limit,
  });

  Pagination.fromJson(dynamic json) {
    total = json['total'];
    pages = json['pages'];
    page = json['page'];
    limit = json['limit'];
  }
  int? total;
  int? pages;
  int? page;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['pages'] = pages;
    map['page'] = page;
    map['limit'] = limit;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['gender'] = gender;
    map['status'] = status;
    return map;
  }
}

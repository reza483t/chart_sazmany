class json_model_class {
  String? uuid;
  NodeType? nodeType;
  String? parentId;
  Entity? entity;
  String? subtitle;
  String? description;

  json_model_class({
    this.uuid,
    this.nodeType,
    this.parentId,
    this.entity,
    this.subtitle,
    this.description,
  });

  json_model_class.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    nodeType = json['node_type'] != null
        ? new NodeType.fromJson(json['node_type'])
        : null;
    parentId = json['parent_id'];
    entity =
        json['entity'] != null ? new Entity.fromJson(json['entity']) : null;
    subtitle = json['subtitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    if (this.nodeType != null) {
      data['node_type'] = this.nodeType!.toJson();
    }
    data['parent_id'] = this.parentId;
    if (this.entity != null) {
      data['entity'] = this.entity!.toJson();
    }
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    return data;
  }
}

class NodeType {
  int? id;
  String? title;
  Null? parent;

  NodeType({this.id, this.title, this.parent});

  NodeType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['parent'] = this.parent;
    return data;
  }
}

class Entity {
  String? uuid;
  String? title;
  Null? image;

  Entity({this.uuid, this.title, this.image});

  Entity.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}

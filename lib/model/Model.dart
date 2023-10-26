class ChatUser {
  ChatUser({
    required this.name,
    required this.email,
    required this.id,
    required this.image,
  });
  late final String name;
  late final String email;
  late final String id;
  late final String image;

  ChatUser.fromJson(Map<String, dynamic> json){
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    id = json['id'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['id'] = id;
    _data['image'] = image;
    return _data;
  }
}
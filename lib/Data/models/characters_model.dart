// ignore_for_file: public_member_api_docs, sort_constructors_first
class Character {
  late int id;
  late String? name;
  late String? status;
  late String? species;
  late String? type;
  late String? gender;
  late String? image;
  late String? created;

  Character(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.created,
  );

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    created = json['created'];
  }
}

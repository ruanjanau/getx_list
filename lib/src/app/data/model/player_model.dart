import '../../domain/entities/enities.dart';

class PlayersModel {
  final int? id;
  final String? name;
  final String? idade;
  final String? aniversario;
  final String? profession;
  final String? team;
  final String? country;
  final String? image;

  PlayersModel({
    this.id,
    this.name,
    this.idade,
    this.aniversario,
    this.profession,
    this.team,
    this.country,
    this.image,
  });

  factory PlayersModel.fromJson(dynamic map) {
    return PlayersModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      idade: map['idade'] ?? '',
      aniversario: map['aniversario'] ?? '',
      profession: map['profession'] ?? '',
      team: map['team'] ?? '',
      country: map['country'] ?? '',
      image: map['image'] ?? '',
    );
  }

  PlayersEntity toEntity() {
    return PlayersEntity(
      id: id ?? 0,
      name: name ?? '',
      idade: idade ?? '',
      aniversario: aniversario ?? '',
      profession: profession ?? '',
      team: team ?? '',
      country: country ?? '',
      image: image ?? '',
    );
  }
}

import '../../entities/user/user.dart';

class UserDTO extends User {
  final String client_id;
  final String cpf;

  const UserDTO({
    required this.client_id,
    required this.cpf,
  }) : super(client_id: client_id, cpf: cpf);

  Map<String, dynamic> toMap() {
    return {
      'client_id': client_id,
      'cpf': cpf,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      client_id: map['client_id'] ?? "",
      cpf: map['cpf'] ?? "",
    );
  }
}

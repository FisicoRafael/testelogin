

abstract class Failure  {
  const Failure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class GeneralFailure extends Failure {
  const GeneralFailure(
      {required String message //TODO = 'falha geral, ainda será decidido',
      })
      : super(message: message);
}

class NoImageFailure extends Failure {
  const NoImageFailure() : super(message: 'Nenhuma imagem foi selecionada.');
}

class PermissionFailure extends Failure {
  const PermissionFailure({
    required String message,
  }) : super(message: message);

  factory PermissionFailure.fromCode(String errorCode) {
    String errorMessage;
    switch (errorCode) {
      case 'photo_access_denied':
        errorMessage = 'Não temos permissão para acessar a galeria. '
            'Você pode mudar isso nas configurações do aparelho.';
        break;
      default:
        errorMessage = 'Um erro inesperado aconteceu. Tente novamente.';
    }
    return PermissionFailure(message: errorMessage);
  }
}

class RequestFailure extends Failure {
  const RequestFailure(String message) : super(message: message);
}

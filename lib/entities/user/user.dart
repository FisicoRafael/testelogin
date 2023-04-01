class User {
  final String client_id;
  final String cpf;

  const User({
    required this.client_id,
    required this.cpf,
  });

  String paramsLoagin() {
    const String response_type = 'code';
    const String scope = 'code';
    const String redirect_uri = 'code';
    const String nonce = 'code';
    const String state = 'code';
    const String code_challenge = 'code';
    const String code_challenge_method = 'code';
    return "?response_type=$response_type&client_id=$client_id&scope=$scope&redirect_uri=$redirect_uri&nonce=$nonce&state=$state&code_challenge=$code_challenge&code_challenge_method=$code_challenge_method";
  }
}

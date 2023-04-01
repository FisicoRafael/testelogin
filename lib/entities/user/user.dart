class User {
  final String client_id;
  final String cpf;

  const User({
    required this.client_id,
    required this.cpf,
  });

  String paramsLoagin() {
    const String response_type = 'code';
    const String scope = 'openid+email+profile+govbr_confiabilidades';
    const String redirect_uri = '';
    const String nonce = '';
    const String state = '';
    const String code_challenge = 'J0AV2KiMhCpby5FB0l6F1BdutmCAMGbn7M1LKy0DI60';
    const String code_challenge_method = 'S256';
    return "?response_type=$response_type&client_id=$client_id&scope=$scope&redirect_uri=$redirect_uri&nonce=$nonce&state=$state&code_challenge=$code_challenge&code_challenge_method=$code_challenge_method";
  }
}

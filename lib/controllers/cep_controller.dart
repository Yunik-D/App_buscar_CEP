import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atividade_api/models/cep_model.dart';
class CepController {
final _httpClient = http.Client();
CepModel cep = CepModel();
carregarCEP(String input) async {
final response = await _httpClient.get(
Uri.parse('https://viacep.com.br/ws/$input/json/'),
);
if (response.statusCode == 200) {
final json = jsonDecode(response.body);
cep = CepModel.fromJson(json);
return cep;
} else {
throw Exception('Erro ao carregar o CEP');
}
}
}

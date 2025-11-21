import 'package:flutter/material.dart';
import 'package:atividade_api/controllers/cep_controller.dart';
import 'package:atividade_api/models/cep_model.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  bool isLoading = true;
  CepModel? cepModel;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Digite um cep',
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final CepModel cepModel =
                        await CepController().carregarCEP(textController.text);
                    setState(() {
                      this.cepModel = cepModel;
                      isLoading = false;
                    });
                  },
                  child: const Text('Buscar CEP'),
                ),
              ),
              const SizedBox(height: 40),
              if (isLoading)
                Container()
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CEP: ${cepModel!.cep}'),
                    Text('Logradouro: ${cepModel!.logradouro}'),
                    Text('Complemento: ${cepModel!.complemento}'),
                    Text('Bairro: ${cepModel!.bairro}'),
                    Text('Localidade: ${cepModel!.localidade}'),
                    Text('UF: ${cepModel!.uf}'),
                    Text('IBGE: ${cepModel!.ibge}'),
                    Text('GIA: ${cepModel!.gia}'),
                    Text('DDD: ${cepModel!.ddd}'),
                    Text('SIAFI: ${cepModel!.siafi}'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

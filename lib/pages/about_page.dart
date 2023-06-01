import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 40),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Sobre",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Bem-vindo ao ML Invest, nosso aplicativo inovador de previsão de tendências de ações! Aqui, gostaríamos de apresentar o trabalho de TCC desenvolvido na Faculdade da UNOESC, que resultou neste aplicativo de código aberto que está diante de você.",
                style: TextStyle(color: Colors.grey),
              ),
              _getSector("Nossa Missão",
                  "Nosso objetivo ao criar o ML Invest foi fornecer aos usuários acesso a previsões confiáveis sobre a tendência de ações específicas do mercado brasileiro. Utilizando técnicas avançadas de aprendizado de máquina, geramos modelos usando Python e a arquitetura LSTM (Long Short-Term Memory). Esses modelos foram treinados com dados abrangentes de variação de preços, incluindo informações como valores de abertura, fechamento, média, entre outros."),
              _getSector("Como Funciona",
                  "Para fornecer previsões precisas, alimentamos nosso modelo com os últimos cinco anos de dados de preço das ações. Com base nessa análise, determinamos o valor previsto para o próximo dia. Ao comparar essa previsão com o preço atual, definimos a tendência da ação como sendo de alta, neutra ou baixa, quando há uma diferença de 1%."),
              _getSector("Nosso Compromisso",
                  "O ML Invest foi desenvolvido durante o curso de Ciência da Computação na UNOESC, localizada em São Miguel do Oeste, Santa Catarina. Buscamos utilizar apenas serviços gratuitos para manter o aplicativo online, o que nos leva a uma restrição importante: o servidor é desligado a cada 15 minutos. Portanto, pode levar um tempo para carregar os dados quando você faz a primeira requisição."),
              _getSector("Atualizações em Tempo Real",
                  "Visando manter você sempre atualizado, atualizamos as tendências das ações nos seguintes horários programados: 7h, 9h, 12h, 15h e 18h. Dessa forma, garantimos que você tenha acesso às informações mais recentes sobre as ações selecionadas, permitindo que tome decisões embasadas no mercado financeiro."),
              _getSector("Código Aberto",
                  "O ML Invest é um projeto de código aberto, o que significa que você pode explorar, modificar e contribuir para o seu desenvolvimento."),
              const SizedBox(
                height: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      InkWell(
                          onTap: () => launchUrl(
                              Uri.parse(
                                  "https://github.com/andremoreirasmo/ml-invest-app"),
                              mode: LaunchMode.externalApplication),
                          child: const Text("Link para o Frontend",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold))),
                      InkWell(
                          onTap: () => launchUrl(
                              Uri.parse(
                                  "https://github.com/andremoreirasmo/ml-invest-backend"),
                              mode: LaunchMode.externalApplication),
                          child: const Text("Link para o Backend",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ],
              ),
              _getSector("Nossa Paixão",
                  "Estamos entusiasmados com o desenvolvimento deste aplicativo e acreditamos que ele representa uma inovação significativa no campo da previsão de tendências de ações. Nossa equipe dedicou-se a explorar os avanços da aprendizagem de máquina e a aplicá-los ao contexto do mercado brasileiro. Esperamos que esta ferramenta traga benefícios práticos aos investidores e entusiastas do mercado financeiro, fornecendo informações valiosas para auxiliar em suas tomadas de decisão."),
            ],
          ),
        ),
      )),
    );
  }

  Widget _getSector(String title, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

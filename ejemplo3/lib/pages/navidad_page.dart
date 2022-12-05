import 'package:ejemplo3/provider/change_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ActividadPage extends StatelessWidget {
  const ActividadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cenas = [
      'https://wongfood.vteximg.com.br/arquivos/ids/599101-1000-1000/Cena-Tradici-n-Metro-6-Personas-1-177505169.jpg?v=638046816410230000',
      'https://wongfood.vteximg.com.br/arquivos/ids/599099-750-750/Cena-Noche-Buena-Metro-4-Personas-1-255849.jpg?v=638046816402230000',
      'https://wongfood.vteximg.com.br/arquivos/ids/599107-750-750/CENA-METRO-BY-ISOLINA-Cena-Metro-by-Isolina-1-351636277.jpg?v=638046816430530000',
      'https://wongfood.vteximg.com.br/arquivos/ids/584234-750-750/Metro-2-Pollos-Rostizados-2-Porciones-de-Papas-fritas-400-g-c-u-Gaseosa-1-5-Litro-1-8214.jpg?v=638005342860270000',
    ];

    final cambio = Provider.of<ChangeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (cambio.datoT == false)
            ? const Text(
                'BIENVENIDO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 252, 165, 4),
                ),
              )
            : const Text(
                'FELIZ NAVIDAD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 243, 3, 3),
                ),
              ),
        actions: [
          Switch(
            value: cambio.datoT,
            onChanged: (value) {
              cambio.cambiarT(value);
              cambio.btnMostrarAlerta();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Switch polo norte
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Polo Norte',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 7, 3, 243),
                    ),
                  ),
                ),
                Switch(
                  value: cambio.dato,
                  onChanged: (value) {
                    cambio.cambiar(value);
                    cambio.btnMostrarAlerta();
                  },
                ),
              ],
            ),

            //Switch cenas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Cenas Navideñas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 7, 133, 122),
                    ),
                  ),
                ),
                Switch(
                  value: cambio.dato2,
                  onChanged: (value) {
                    cambio.cambiar2(value);
                    cambio.btnMostrarAlerta();
                  },
                ),
              ],
            ),

            Visibility(
              visible: cambio.isEmpty,
              child: Lottie.network(
                  'https://assets4.lottiefiles.com/packages/lf20_cgwai2nz.json'),
            ),

            const SizedBox(height: 20.0),
            Visibility(
              visible: cambio.dato,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2012/04/13/01/23/moon-31665_960_720.png',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            //Lista de cenas
            Visibility(
              visible: cambio.dato2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Cenas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 238, 5, 83),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: cenas.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                cenas[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.grey,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Text('Cena $index'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

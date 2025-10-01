import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jupyter/configs/constants/supabase_config.dart';
import 'package:jupyter/configs/theme/theme_changer.dart';
import 'package:jupyter/feature/login/view/login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await SupabaseConfig.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jupyter',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeChanger>(context).theme,
      home: const LoginPage(),
    );
  }
}

// class TestePage extends StatefulWidget {
//   const TestePage({super.key});

//   @override
//   State<TestePage> createState() => _TestePageState();
// }

// class _TestePageState extends State<TestePage> {
//   late InsertVeiculoUseCase insertVeiculoUseCase;

//   @override
//   void initState() {
//     super.initState();
//     insertVeiculoUseCase = InsertVeiculoUseCase(
//       VeiculoRepositoryImpl(
//         VeiculoDao(
//           SupabaseClient(EnvConfig.supabaseUrl, EnvConfig.supabaseAnonKey),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       body: Center(
//         child: CustomButton(
//           backgroundColor: Theme.of(context).colorScheme.secondary,
//           title: "AdicionarVeiculo",
//           onPressed: () => insertVeiculoUseCase.call(veiculo),
//         ),
//       ),
//     );
//   }

//   final veiculo = Veiculo(
//     placa: 'QWE4R56',
//     renavam: '98765432109',
//     chassi: '8AP_MF82_4_L_G123456',
//     cor: 'Branco',
//     marca: 'Fiat',
//     modelo: 'Mobi',
//     anoFabricacao: 2021,
//     anoModelo: 2021,
//     combustivel: 'Flex',
//     categoria: 'Hatch',
//     locadora: null,
//     situacao: 'Ativo',
//     dataAquisicao: DateTime(2021, 5, 20),
//     dataVenda: null,
//     kmAtual: 67345,
//     kmUltimaRevisao: 60050,
//     dataUltimaRevisao: DateTime(2025, 8, 1),
//   );
// }

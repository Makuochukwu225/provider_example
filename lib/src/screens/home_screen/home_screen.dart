import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/provider/movie_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<MovieProvider>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Game of throne books'),
        ),
        body: Builder(builder: (context) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                var data = provider.model![index];
                return ListTile(
                  onTap: () {},
                  title: Text(data.isbn!.toString()),
                  subtitle: Text(data.numberOfPages!.toString()),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: provider.model!.length);
        }),
      );
    });
  }
}

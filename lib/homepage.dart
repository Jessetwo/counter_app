import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Second_page.dart';
import 'package:provider_app/counter_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Provider",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Flutter Counter app with Provider',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
                  return Text(
                    'We currently count at: ${counterProvider.x}',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().increment();
                    },
                    child: const Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    },
                    child: const Text('Go to the next page'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

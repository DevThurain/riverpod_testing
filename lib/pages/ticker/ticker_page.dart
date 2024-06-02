import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<String> names = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Emma',
  'Frank',
  'Grace',
  'Henry',
  'Isla',
  'Jack',
  'Katie',
  'Liam',
  'Mia',
  'Noah',
  'Olivia',
  'Paul',
  'Quinn',
  'Ryan',
  'Sophia',
  'Thomas',
  'Uma',
  'Victoria',
  'William',
  'Xander',
  'Yara',
  'Zoe'
];

var tickerProvider = StreamProvider((ref) {
  return Stream.periodic(const Duration(seconds: 1), (x) => x + 1);
});

var nameProvider = StreamProvider((ref) {
  return ref.watch(tickerProvider.stream).map((count) => names.getRange(0, count));
});



class TickerPage extends ConsumerWidget {
  static const routeName = 'ticker_page';
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameData = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticker Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: nameData.when(
              data: (nameList) => ListView.builder(
                  itemCount: nameList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        nameList.elementAt(index),
                      ),
                      onTap: () async {
                        var data = await ref.read(tickerProvider.future);
                        print(data);
                      },
                    );
                  }),
              error: (error, stackTrace) => const Text("End of List."),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

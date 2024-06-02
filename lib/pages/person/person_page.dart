import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String uuid;

  Person({
    required this.name,
    required this.age,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  Person updated([String? name, int? age]) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      uuid: uuid,
    );
  }

  @override
  bool operator ==(covariant Person other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  @override
  String toString() => "Person(name: $name, age: $age, uuid: $uuid)";

  String get displayName => "$name ($age years old)";
}

class DataModel extends ChangeNotifier {
  final List<Person> _personList = [];

  UnmodifiableListView<Person> get personList => UnmodifiableListView(_personList);
  int get itemLength => _personList.length;

  void add(Person person) {
    _personList.add(person);
    notifyListeners();
  }

  void remove(Person person) {
    _personList.remove(person);
    notifyListeners();
  }

  void update(Person updatedPerson) {
    var exisitingIndex = _personList.indexOf(updatedPerson);
    _personList[exisitingIndex] = updatedPerson.updated(updatedPerson.name, updatedPerson.age);
    notifyListeners();
  }
}

var personProvider = ChangeNotifierProvider((ref) => DataModel());

class PersonPage extends ConsumerWidget {
  static const routeName = 'person_page';
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(personProvider);
    debugPrint(data._personList.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          return ListView.builder(
              itemCount: data.itemLength,
              itemBuilder: (context, index) {
                var person = data.personList[index];
                return ListTile(
                  title: Text(person.displayName),
                  onTap: () async {
                    var updatedPerson = await createOrUpdatePerson(context: context, oldPerson: person);
                    if (updatedPerson != null) {
                      data.update(updatedPerson);
                    }
                  },
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var newPerson = await createOrUpdatePerson(context: context);
          debugPrint(newPerson.toString());
          if (newPerson != null) {
            data.add(newPerson);
          }
        },
      ),
    );
  }
}

var nameController = TextEditingController();
var ageController = TextEditingController();

Future<Person?> createOrUpdatePerson({required BuildContext context, Person? oldPerson}) {
  String? name = oldPerson?.name;
  int? age = oldPerson?.age;
  nameController.text = name ?? '';
  ageController.text = age != null ? age.toString() : '';
  return showDialog<Person?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Person'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: name ?? 'Enter Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(hintText: age == null ? 'Enter Age' : age.toString()),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  age = int.tryParse(value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  if (name != null && age != null) {
                    if (oldPerson != null) {
                      Navigator.of(context).pop(oldPerson.updated(name, age));
                    } else {
                      Navigator.of(context).pop(Person(name: name!, age: age!));
                    }
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save')),
          ],
        );
      });
}

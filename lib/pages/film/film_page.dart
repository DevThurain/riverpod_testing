import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  bool operator ==(covariant Film other) {
    return id == other.id && isFavorite == other.isFavorite;
  }

  @override
  int get hashCode => Object.hashAll([id, isFavorite]);

  Film copy({required isFav}) => Film(
        id: id,
        title: title,
        description: description,
        isFavorite: isFav,
      );
}

const List<Film> filmList = [
  Film(
    id: '1',
    title: 'Inception',
    description: 'A mind-bending thriller by Christopher Nolan.',
    isFavorite: false,
  ),
  Film(
    id: '2',
    title: 'The Matrix',
    description: 'A sci-fi classic about a dystopian future.',
    isFavorite: true,
  ),
  Film(
    id: '3',
    title: 'Interstellar',
    description: 'A journey through space and time to save humanity.',
    isFavorite: false,
  ),
  Film(
    id: '4',
    title: 'The Dark Knight',
    description: 'Batman faces off against the Joker in Gotham City.',
    isFavorite: true,
  ),
  Film(
    id: '5',
    title: 'Fight Club',
    description: 'An insomniac office worker crosses paths with a devil-may-care soap maker.',
    isFavorite: false,
  ),
  Film(
    id: '6',
    title: 'Pulp Fiction',
    description: 'Multiple stories interweave in this Quentin Tarantino classic.',
    isFavorite: true,
  ),
  Film(
    id: '7',
    title: 'The Shawshank Redemption',
    description: 'Two imprisoned men bond over a number of years.',
    isFavorite: false,
  ),
  Film(
    id: '8',
    title: 'The Godfather',
    description: 'The aging patriarch of an organized crime dynasty transfers control to his son.',
    isFavorite: true,
  ),
];

enum FilmType { all, favorite, noFavorite }

var filmTypeProvider = StateProvider((ref) => FilmType.all);

class FilmListNotifier extends StateNotifier<List<Film>> {
  FilmListNotifier() : super(filmList);

  void addToFavorite(Film film) {
    state = state.map((f) => f.id == film.id ? film.copy(isFav: true) : f).toList();
  }

  void removeFromFavorite(Film film) {
    state = state.map((f) => f.id == film.id ? film.copy(isFav: false) : f).toList();
  }
}

var allFilmListProvider =
    StateNotifierProvider<FilmListNotifier, List<Film>>((ref) => FilmListNotifier());

var favoriteFilmListProvider =
    Provider<Iterable<Film>>((ref) => ref.watch(allFilmListProvider).where((film) => film.isFavorite));

var noFavoriteFilmListProvider =
    Provider<Iterable<Film>>((ref) => ref.watch(allFilmListProvider).where((film) => !film.isFavorite));

class FilmPage extends StatelessWidget {
  static const routeName = 'film_page';
  const FilmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film'),
      ),
      body: Column(
        children: [
          const FilterWidget(),
          Consumer(
            builder: (context, ref, child) {
              switch (ref.watch(filmTypeProvider)) {
                case FilmType.all:
                  return FilmListWidget(provider: allFilmListProvider);

                case FilmType.favorite:
                  return FilmListWidget(provider: favoriteFilmListProvider);

                case FilmType.noFavorite:
                  return FilmListWidget(provider: noFavoriteFilmListProvider);
              }
            },
          ),
        ],
      ),
    );
  }
}

class FilmListWidget extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmListWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filmList = ref.watch(provider);
    return Expanded(
      child: ListView.builder(
        itemCount: filmList.length,
        itemBuilder: ((context, index) {
          var film = filmList.elementAt(index);
          return ListTile(
            title: Text(film.title),
            subtitle: Text(film.description),
            trailing: IconButton(
              icon: film.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
              onPressed: () {
                if (film.isFavorite) {
                  ref.read(allFilmListProvider.notifier).removeFromFavorite(film);
                } else {
                  ref.read(allFilmListProvider.notifier).addToFavorite(film);
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton<FilmType>(
          value: ref.watch(filmTypeProvider),
          items: FilmType.values
              .map((filmType) => DropdownMenuItem(
                    value: filmType,
                    child: Text(filmType.name),
                  ))
              .toList(),
          onChanged: (selectedFilmType) {
            ref.read(filmTypeProvider.notifier).state = selectedFilmType!;
          },
        );
      },
    );
  }
}

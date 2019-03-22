import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'hero.dart';
//import 'mock_heroes.dart';
//import 'hero_component.dart';
import 'hero_service.dart';
import 'route_paths.dart' as paths;
import 'routes.dart';

//import 'src/todo_list/todo_list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-heroes',
  /*template: '''
    <h1>{{title}}</h1>
    <h2>{{heroe.name}}</h2>
    <div><label>id: </label>{{heroe.id}}</div>
    <div>
      <label>name: </label>
      <input [(ngModel)]="heroe.name" placeholder="name">
    </div>
    ''',*/
    //<input [(ngModel)]="heroe.name" placeholder="name">
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
  directives: [coreDirectives],// HeroComponent],  
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)

class HeroListComponent implements OnInit{
  final HeroService _heroService;
  final Router _router;

  List<Hero> heroes; // = mockHeroes;
  Hero selected;
  
  HeroListComponent(this._heroService, this._router);

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }
  
  void ngOnInit() => _getHeroes();

  void onSelect(Hero heroe) => selected = heroe;

  String _heroUrl (int id) => RoutePaths.hero.toUrl(parameters: {paths.idParam: '$id'});

  Future<NavigationResult> gotoDetail() => _router.navigate(_heroUrl(selected.id));
}


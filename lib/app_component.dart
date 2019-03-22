import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'src/hero_list_component.dart';
import 'src/hero_service.dart';
import 'src/routes.dart';
import 'src/route_paths.dart';

@Component (
  selector: "my-app",
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="RoutePaths.dashboard.toUrl()" [routerLinkActive]="'active'">Dashboard</a>
      <a [routerLink]="RoutePaths.heroes.toUrl()" [routerLinkActive]="'active'">Heroes</a>
    </nav>
    <router-outlet [routes]="Routes.all"></router-outlet>''',
    /*<h2>{{heroe.name}}</h2>
    <div><label>id: </label>{{heroe.id}}</div>
    <div>
      <label>name: </label>
      <input [(ngModel)]="heroe.name" placeholder="name">
    </div>
    ''',*/
    directives: [routerDirectives],//[RouterOutlet, RouterLink, RouterLinkActive],
    providers: [ClassProvider(HeroService)],
    exports: [RoutePaths, Routes],
    styleUrls: ['app_component.css'],
)

class AppComponent {
  final title = 'Tour of Heroes';
}
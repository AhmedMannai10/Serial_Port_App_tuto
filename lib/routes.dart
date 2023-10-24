import 'package:go_router/go_router.dart';

final _router = GoRouter( 
    initialLocation: "/" ,

    routes: [

        GoRoute(name: "IO", path: "/io", 
            builder: (context, state) => IOPage();
        ),
        GoRoute(name: "Home", path: "/", 
            builder: (context, state) => HomePage();
        )
    ],
) 

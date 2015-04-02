# central.js

> A Backbone-based javascript isomorphic framework

---
## Install

```sh
$ npm install -g central
```

## Usage
#### Bootstrap an app

```sh
$ central app_name
$ npm install
$ grunt
```
#### Use directly
```js
var central = require('central'),
    server = central.createServer();

server.configure({
    routes: routes,
    staticFolder: __dirname + '/public',
    controller: new Controller(),
    rootEl: '.content'
});

server.start();

```

## Documentation

__central.js__ was built around the famous [Backbone.js](http://backbonejs.org/) and highly depends on it. If you are not (yet) familiar with Backbone, it may be better to go and read its documentation first.

#### Controller
The main piece of logic in a __central.js__ application is the `Controller`.
Shared in both client and server, the `Controller` is what brings together Backbone Views, Backbone Models and routing.
The `Controller` works tightly with the `routes.js` file, which usually takes this form :

```coffee
module.exports = [
    path: '/route1', view: 'route1'
    path: '/route2', view: 'route2'
]
```

A __central.js__ controller typically looks like this :

```coffee
BaseController = require('central/shared/controller.coffee')
MyView = require('../views/my_view.coffee')
MyModel = require('../models/my_model.coffee')

class MyController extends BaseController

    route1: @::view(MyView) (params) ->
        myModel = new MyModel(name: 'Tom', age: 18)
        return model: myModel

    route2: @::viewWithCallback(MyView) (params, callback) ->
        myModel = new MyModel()
        myModel.fetch
            success: ->
                // do stuff
                callback(model: myModel)
            error: ->
                // do error stuff
                callback(model: myModel)
```

In this example, whenever the user hits `route1`, the `Controller` will instantiate `MyModel` and pass it to the `MyView` view.
`route1` uses the `::view()` decorator which tells the `Controller` what `Backbone.View` it should use.

For `route2`, the `Controller` first instantiate a model and requests some data from the database. The `@::viewWithCallback` decorator allows the controller to wait for the database results before rendering the view, which is only triggered when `callback` is called.

The syntax of the `Controller` is the only thing that is imposed when developing an isomorphic application with __central.js__. Pretty much everything else will look like a regular Backbone.js client-side application.

#### Launching the app
__central.js__ uses an instance of [express.js](expressjs.com), which is a server-side server based on node.js, to handle responses. You can use this instance as your primary server, or just to handle your Backbone.js isomorphic application.

To launch the server, you only need a `index.js` file where you will basically put :

```js
var central = require('central'),
    routes = require('./app/routes'),
    Controller = require('./app/controller.coffee'),
    server = central.createServer();

server.configure({
    routes: routes,
    staticFolder: __dirname + '/public' // path to the static folder
    controller: new Controller(),
    rootEl: '.content' // CSS selector in the layout file where you want to render your views
});

server.start();

```

and then

```sh
$ node index.js
```


## License

MIT © [Arthur Himmel](http://arthurhimmel.com)

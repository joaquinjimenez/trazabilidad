<!doctype html>
<html lang="es" >
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Blogcito</title>
		<!-- Bootstrap core CSS -->
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom fonts for this template -->
		<link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
		<!-- Plugin CSS -->
		<link href="/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="/css/creative.min.css" rel="stylesheet">

		<style>[ng-cloak] { display: none; }</style>
	</head>

	<body id="page-top">
		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="#page-top">Comenzando</a>
				<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			  		<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<a class="nav-link js-scroll-trigger" href="#about">About</a>
						</li>
						<li class="nav-item">
							<a class="nav-link js-scroll-trigger" href="#services">Services</a>
						</li>
						<li class="nav-item">
							<a class="nav-link js-scroll-trigger" href="#portfolio">ads</a>
						</li>
						<li class="nav-item">
							<a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<section class="bg-primary" id="about">

		
			<section class="todoapp">
				<div class="container" id="header">
					<div class="row">
						<div class="col-lg-12 text-center">
							<h2 class="section-heading text-white">todos</h2>
							 <input class="new-todo"
						      autofocus autocomplete="off"
						      placeholder="What needs to be done?"
						      v-model="newTodo"
						      @keyup.enter="addTodo">
						</div>
					</div>
				</div>
				<div class="container" id="main" v-show="todos.length" v-cloak >
					<div class="row">
						    <input class="toggle-all" type="checkbox" v-model="allDone">
						    <ul class="todo-list">
						      <li v-for="todo in filteredTodos"
						        class="todo"
						        :key="todo.id"
						        :class="{ completed: todo.completed, editing: todo == editedTodo }">
						        <div class="view">
						          <input class="toggle" type="checkbox" v-model="todo.completed">
						          <label @dblclick="editTodo(todo)">@{{ todo.title }}</label>
						          <button class="destroy" @click="removeTodo(todo)"></button>
						        </div>
						        <input class="edit" type="text"
						          v-model="todo.title"
						          v-todo-focus="todo == editedTodo"
						          @blur="doneEdit(todo)"
						          @keyup.enter="doneEdit(todo)"
						          @keyup.esc="cancelEdit(todo)">
						      </li>
						    </ul>
					</div>
					<div class="row">
						<footer class="footer" v-show="todos.length" v-cloak>
						    <span class="todo-count">
						      <strong>@{{ remaining }}</strong> @{{ remaining | pluralize }} left
						    </span>
						    <ul class="filters">
						      <li><a href="#/all" :class="{ selected: visibility == 'all' }">All</a></li>
						      <li><a href="#/active" :class="{ selected: visibility == 'active' }">Active</a></li>
						      <li><a href="#/completed" :class="{ selected: visibility == 'completed' }">Completed</a></li>
						    </ul>
						    <button class="clear-completed" @click="removeCompleted" v-show="todos.length > remaining">
						      Clear completed
						    </button>
						  </footer>
					</div>
				</div>
			</section>
		</section>
		
		<!-- Bootstrap core JavaScript -->
		<script src="/vendor/jquery/jquery.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Plugin JavaScript -->
		<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
		<script src="/vendor/scrollreveal/scrollreveal.min.js"></script>
		<script src="/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
		<!-- Custom scripts for this template -->
		<script src="/js/creative.min.js"></script>


				<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
<script>
	// Full spec-compliant TodoMVC with localStorage persistence
// and hash-based routing in ~120 effective lines of JavaScript.

// localStorage persistence
var STORAGE_KEY = 'todos-vuejs-2.0'
var todoStorage = {
  fetch: function () {
    var todos = JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]')
    todos.forEach(function (todo, index) {
      todo.id = index
    })
    todoStorage.uid = todos.length
    return todos
  },
  save: function (todos) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(todos))
  }
}

// visibility filters
var filters = {
  all: function (todos) {
    return todos
  },
  active: function (todos) {
    return todos.filter(function (todo) {
      return !todo.completed
    })
  },
  completed: function (todos) {
    return todos.filter(function (todo) {
      return todo.completed
    })
  }
}

// app Vue instance
var app = new Vue({
  // app initial state
  data: {
    todos: todoStorage.fetch(),
    newTodo: '',
    editedTodo: null,
    visibility: 'all'
  },

  // watch todos change for localStorage persistence
  watch: {
    todos: {
      handler: function (todos) {
        todoStorage.save(todos)
      },
      deep: true
    }
  },

  // computed properties
  // http://vuejs.org/guide/computed.html
  computed: {
    filteredTodos: function () {
      return filters[this.visibility](this.todos)
    },
    remaining: function () {
      return filters.active(this.todos).length
    },
    allDone: {
      get: function () {
        return this.remaining === 0
      },
      set: function (value) {
        this.todos.forEach(function (todo) {
          todo.completed = value
        })
      }
    }
  },

  filters: {
    pluralize: function (n) {
      return n === 1 ? 'item' : 'items'
    }
  },

  // methods that implement data logic.
  // note there's no DOM manipulation here at all.
  methods: {
    addTodo: function () {
      var value = this.newTodo && this.newTodo.trim()
      if (!value) {
        return
      }
      this.todos.push({
        id: todoStorage.uid++,
        title: value,
        completed: false
      })
      this.newTodo = ''
    },

    removeTodo: function (todo) {
      this.todos.splice(this.todos.indexOf(todo), 1)
    },

    editTodo: function (todo) {
      this.beforeEditCache = todo.title
      this.editedTodo = todo
    },

    doneEdit: function (todo) {
      if (!this.editedTodo) {
        return
      }
      this.editedTodo = null
      todo.title = todo.title.trim()
      if (!todo.title) {
        this.removeTodo(todo)
      }
    },

    cancelEdit: function (todo) {
      this.editedTodo = null
      todo.title = this.beforeEditCache
    },

    removeCompleted: function () {
      this.todos = filters.active(this.todos)
    }
  },

  // a custom directive to wait for the DOM to be updated
  // before focusing on the input field.
  // http://vuejs.org/guide/custom-directive.html
  directives: {
    'todo-focus': function (el, binding) {
      if (binding.value) {
        el.focus()
      }
    }
  }
})

// handle routing
function onHashChange () {
  var visibility = window.location.hash.replace(/#\/?/, '')
  if (filters[visibility]) {
    app.visibility = visibility
  } else {
    window.location.hash = ''
    app.visibility = 'all'
  }
}

window.addEventListener('hashchange', onHashChange)
onHashChange()

// mount
app.$mount('.todoapp')

</script>

	</body>

	
</html>


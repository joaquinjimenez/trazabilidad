<!doctype html>
<html lang="en" ng-app="todomvc" data-framework="firebase">
	<head>
		<meta charset="utf-8">
		<title>Firebase &amp; AngularJS • TodoMVC</title>
		<link rel="stylesheet" href="node_modules/todomvc-common/base.css">
		<link rel="stylesheet" href="node_modules/todomvc-app-css/index.css">
		<style>[ng-cloak] { display: none; }</style>
	</head>
	<body>
		<section id="todoapp" ng-controller="TodoCtrl">
			<header id="header">
				<h1>todos</h1>
				<form id="todo-form" ng-submit="addTodo()">
					<input id="new-todo" placeholder="What needs to be done?" ng-model="newTodo" autofocus>
				</form>
			</header>
			<section id="main" ng-show="totalCount" ng-cloak>
				<input id="toggle-all" type="checkbox" ng-model="allChecked" ng-click="markAll(allChecked)">
				<label for="toggle-all">Mark all as complete</label>
				<ul id="todo-list">
					<li ng-repeat="(id, todo) in todos | todoFilter" ng-class="{completed: todo.completed, editing: todo == editedTodo}">
						<div class="view">
							<input class="toggle" type="checkbox" ng-model="todo.completed" ng-change="todos.$save(todo)">
							<label ng-dblclick="editTodo(todo)">{{todo.title}}</label>
							<button class="destroy" ng-click="removeTodo(todo)"></button>
						</div>
						<form ng-submit="doneEditing(todo)">
							<input class="edit" ng-model="todo.title" todo-escape="revertEditing(todo)" todo-blur="doneEditing(todo)" todo-focus="todo == editedTodo">
						</form>
					</li>
				</ul>
			</section>
			<footer id="footer" ng-show="totalCount" ng-cloak>
				<span id="todo-count"><strong>{{remainingCount}}</strong>
					<ng-pluralize count="remainingCount" when="{ one: 'item left', other: 'items left' }"></ng-pluralize>
				</span>
				<ul id="filters">
					<li>
						<a ng-class="{selected: location.path() == '/'} " href="#/">All</a>
					</li>
					<li>
						<a ng-class="{selected: location.path() == '/active'}" href="#/active">Active</a>
					</li>
					<li>
						<a ng-class="{selected: location.path() == '/completed'}" href="#/completed">Completed</a>
					</li>
				</ul>
				<button id="clear-completed" ng-click="clearCompletedTodos()" ng-show="completedCount">Clear completed</button>
			</footer>
		</section>
		<footer id="info">
			<p>Double-click to edit a todo</p>
			<p>Credits:
				<a href="http://twitter.com/cburgdorf">Christoph Burgdorf</a>,
				<a href="http://ericbidelman.com">Eric Bidelman</a>,
				<a href="http://twitter.com/_davideast">David East</a>,
				<a href="http://jacobmumm.com">Jacob Mumm</a> and
				<a href="http://blog.igorminar.com">Igor Minar</a>
			</p>
			<p>Part of <a href="http://todomvc.com">TodoMVC</a></p>
		</footer>
		<script src="//cdn.firebase.com/js/client/2.2.2/firebase.js"></script>
		<script src="node_modules/todomvc-common/base.js"></script>
		<script src="node_modules/angular/angular.js"></script>
		<script src="node_modules/angularfire/dist/angularfire.js"></script>
		<script src="js/app.js"></script>
		<script src="js/controllers/todoCtrl.js"></script>
		<script src="js/directives/todoFocus.js"></script>
		<script src="js/directives/todoBlur.js"></script>
		<script src="js/directives/todoEscape.js"></script>
	</body>
</html>
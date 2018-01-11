<!DOCTYPE html>
<html ng-app="sampleApp">
<head>
	<style>gm-map {display: block; width: 100%; height: 300px;}</style>
	
	
	
	<!-- AngularJS -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js"></script>

<!-- Firebase -->
<script src="https://www.gstatic.com/firebasejs/3.6.6/firebase.js"></script>

<!-- AngularFire -->
<script src="https://cdn.firebase.com/libs/angularfire/2.3.0/angularfire.min.js"></script>


<script>
  // Initialize the Firebase SDK
  var config = {
    apiKey: "AIzaSyAvjusDE9iWml-wx5BHw5VIFLIQAwpOXco",
    authDomain: "hola-mondo.firebaseapp.com",
    databaseURL: "https://hola-mondo.firebaseio.com",
    storageBucket: "hola-mondo.appspot.com"
  };
  firebase.initializeApp(config);
</script>



	<script>
	var app = angular.module('sampleApp', ['firebase'])
		.controller('MpaContoller', function($scope, $firebaseObject, $firebaseArray, $firebaseAuth) {
		var ref = firebase.database().ref().child("messages");
	  // create a synchronized array
	  $scope.messages = $firebaseArray(ref);
	  // add new items to the array
	  // the message is automatically added to our Firebase database!
	  $scope.addMessage = function() {
	    $scope.messages.$add({
	      text: $scope.newMessageText
	    });
	  };

	 var auth = $firebaseAuth();

    $scope.signIn = function() {
      $scope.firebaseUser = null;
      $scope.error = null;

      auth.$signInAnonymously().then(function(firebaseUser) {
        $scope.firebaseUser = firebaseUser;
      }).catch(function(error) {
        $scope.error = error;
      });

    };

	  // click on `index.html` above to see $remove() and $save() in action
	}); 
	</script>
</head>
	 <body ng-controller="MpaContoller">
	  <ul>
      <li ng-repeat="message in messages">
        <!-- edit a message -->
        <input ng-model="message.text" ng-change="messages.$save(message)" />
        <!-- delete a message -->
        <button ng-click="messages.$remove(message)">Delete Message</button>
      </li>
    </ul>
    <!-- push a new message onto the array -->
    <form ng-submit="addMessage()">
      <input ng-model="newMessageText" />
      <button type="submit">Add Message</button>
    </form>



    <button ng-click="signIn()">Sign In Anonymously</button>

	  <p ng-if="firebaseUser">Signed in user: <strong>@{{ firebaseUser.uid }}</strong></p>
	  <p ng-if="error">Error: <strong>@{{ error }}</strong></p>

  </body>
</html>
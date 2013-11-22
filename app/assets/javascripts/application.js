//= require jquery
//= require bootstrap/transition
//= require bootstrap/modal
//= require angular

(function() {
  var app = angular.module('sjdug', []);

  app.controller('mailingList', [
      '$scope', '$http', '$timeout',
      function(scope, $http, $timeout) {
        var NEW_STATE = 'new',
            SUBSCRIBED_STATE = 'subscribed',
            ERROR_STATE = 'error';

        var state = NEW_STATE;

        scope.subscribe = function() {
          $http.post('/subscribe', {
            email: scope.mailingListForm.email
          }).success(function() {
            state = SUBSCRIBED_STATE;
          }).error(function() {
            state = ERROR_STATE;
          });
        };

        scope.isNew = function() {
          return state === NEW_STATE;
        };

        scope.hasSubscribed = function() {
          return state === SUBSCRIBED_STATE;
        };

        scope.hasError = function() {
          return state === ERROR_STATE;
        };

        scope.reset = function() {
          $timeout(function() {
            state = NEW_STATE;
          }, 250);
        }
      }
  ]);
})();

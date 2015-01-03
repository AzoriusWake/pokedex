angular.module('PokemonApp.controllers', [])
.controller('pokemonAppCtrl', function($scope, $http, pokemonAPIservice) {
  $scope.PokemonList = [];
  pokemonAPIservice.getPokemons().success(function (data) {
    $scope.PokemonList = chunk(data, 3);
  });
  $scope.Pokemon = "";
  pokemonAPIservice.getProfile().success(function (data) {
    $scope.Pokemon = data;
  });
  $scope.updateProfile = function() {
    event.preventDefault();
    console.log(event.currentTarget.innerText)
    $http({
      method: 'get',
      url: '/pokemon/profile',
      params: { name: event.currentTarget.innerText }
    })
    .success(function (data) {
      $scope.Pokemon = data;
    });
  }
});

function chunk(arr, size) {
  var newArr = [];
  for (var i=0; i<arr.length; i+=size) {
    newArr.push(arr.slice(i, i+size));
  }
  return newArr;
}
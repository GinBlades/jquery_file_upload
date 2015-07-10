url = "/uploads"
angular.module "demo", ["blueimp.fileupload"]
  .config ($httpProvider, fileUploadProvider) ->
    delete $httpProvider.defaults.headers.common["X-Requested-With"]
    fileUploadProvider.defaults.redirect = window.location.href.replace(
      /\/[^\/]*$/, "/cors/result.html?%s"
    )
  .controller "DemoFileUploadController", ($scope, $http) ->
    $scope.options =
      url: url

  .controller "FileDestroyController", ($scope, $http) ->
    file = $scope.file
    state = undefined

    if file.url
      file.$state = ->
        state
      file.$destroy = ->
        state = "pending"
        $http
          url: file.deleteUrl
          method: file.deleteType
        .then ->
          state = "resolved"
          $scope.clear(file)
        ,
          ->
            state = "rejected"
    else if !file.$cancle && !file._index
      file.$cancel = ->
        $scope.clear(file)




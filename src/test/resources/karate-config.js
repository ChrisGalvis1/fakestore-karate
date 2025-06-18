function fn() {
  var config = {
    baseUrl: 'https://fakestoreapi.com'
  };
  karate.configure('ssl', true);
  return config;
}
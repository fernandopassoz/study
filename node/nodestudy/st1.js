const http = require("http")

const options = {

  // host: 'www.random.org',
  // path: '/integers/?num=1&min=1&max=100&col=1&base=10&format=plain&rnd=new'
  host: 'google.com',
  path: '/'

}

callback = function(response){
  var str = ''

  response.on('data', function(chunk){
    str += chunk
  })

  response.on('end', function(){
    console.log(str)
  })
}

http.request(options, callback).end()

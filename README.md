## demet

**LAMP & LEMP** bundles to use on Docker as container. You can run whichever you want. Also, these containers are contain **PhpMyAdmin, MongoDB and Redis.**

### usage
Clone this repo and run following command in repo you cloned:

```
$ docker-compose -f docker-compose.<WEBSERVER>.yml up --build -d
```
Note: If image is updated, re-run.

### Notes
- Base Directory: http://localhost
- PhpMyadmin Port: 8080
- Mysql Port: 3306
- Redis Port: 6379
- MongoDB Port: 27017

Enter into any container: 
```
$ docker exec -it "container-name" /bin/bash
```

You can change environments ports or configurations like you want. Also, if you have any advice, let me know please.

## Contributing

1. Fork it ( https://github.com/izniburak/demet/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [izniburak](https://github.com/izniburak) İzni Burak Demirtaş - creator, maintainer


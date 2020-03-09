## OpenResty with Moesif API Logging Example

Example Docker application using [Moesif OpenResty plugin](https://github.com/Moesif/lua-resty-moesif) to log API calls to [Moesif API analytics](https://www.moesif.com)

To learn more about configuration options, please refer to [Moesif OpenResty plugin](https://github.com/Moesif/lua-resty-moesif).

## How to run this example
1. Clone this repo and edit the `nginx.conf.d/main.conf` file to set your actual Moesif Application Id.

Your Moesif Application Id can be found in the [_Moesif Portal_](https://www.moesif.com/).
After signing up for a Moesif account, your Moesif Application Id will be displayed during the onboarding steps. 

You can always find your Moesif Application Id at any time by logging 
into the [_Moesif Portal_](https://www.moesif.com/), click on the top right menu,
and then clicking _API Keys_.

2. Build the docker image
```bash
docker build --no-cache -t lua-resty-moesif-example ./
```

3. Start the docker container:
```bash
`docker-compose up -d`
```

By default, The container is listening on port 8000. You should now be able to make a request: 

```bash
curl -X POST -H "Content-Type: application/json" -d '{"name":"moesif"}' "http://localhos:8000/api/api?x=2&y=4" -H 'User-Id:123'   -H "Company-Id:567"
```

4. The data should be captured in the corresponding Moesif account.

Congratulations! If everything was done correctly, Moesif should now be tracking all network requests that match the route you specified earlier. If you have any issues with set up, please reach out to support@moesif.com.

Please note: If you're using `OpenResty` and `luarocks`, please refer to this [example](https://github.com/Moesif/moesif-openresty-example) on how to install Moesif plugin using `luarocks`.

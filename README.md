## Lua Resty Moesif Example

[Moesif](https://www.moesif.com) is an API analyatics platform. [Moesif OpenResty plugin](https://github.com/Moesif/lua-resty-moesif) is a plugin that makes integration with Moesif easy for OpenResty based applications.

This is an example of [OpenResty](https://openresty.org/en/) with Moesif integrated. To learn more about configuration options, please refer to [Moesif OpenResty plugin](https://github.com/Moesif/lua-resty-moesif).

## How to run this example
1. Be sure to edit the nginx.conf.d/main.conf to change the `application_id` to your application id obtained from Moesif.

Your Moesif Application Id can be found in the [_Moesif Portal_](https://www.moesif.com/).
After signing up for a Moesif account, your Moesif Application Id will be displayed during the onboarding steps. 

You can always find your Moesif Application Id at any time by logging 
into the [_Moesif Portal_](https://www.moesif.com/), click on the top right menu,
and then clicking _Installation_.

2. Start the docker-container using `docker-compose up -d`

3. Send the request to the route based on the nginx configuration. 

```bash
curl -X POST -H "Content-Type: application/json" -H "userId: nginxapiuser" -H "X-Forwarded-For: 148.64.111.29:15, 148.64.111.227" -H "X-Moesif-Transaction-Id: 08367f9d-161d-4954-afb8-4d02f03517e3" -d '{"name":"moesif"}' "http://localhost:9000/api/test?x=2&y=4"
```

4. The data should be captured in the corresponding Moesif account.

Congratulations! If everything was done corectly, Moesif should now be tracking all network requests that match the route you specified earlier. If you have any issues with set up, please reach out to support@moesif.com.

Please note: If you're using `OpenResty` and `luarocks`, please refer to this [example](https://github.com/Moesif/moesif-openresty-example) on how to install Moesif plugin using `luarocks`.

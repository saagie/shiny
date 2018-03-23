# Shiny

Shiny base Docker image you can use to expose a Shiny app.

## Extend this image

Build you own image by extending this base following this steps:

Create a file named `Dockerfile` containing:

```
FROM saagie/shiny

MAINTAINER Saagie

# Add our app as the root endpoint
COPY myapp/* /srv/shiny-server/
```

Create a directory named `myapp` in the same folder and put your Shiny app in there.

Run:
`docker build -t myShinyApp .`

This image will expose your app on port 3838.

# Run your container

`docker run -d --rm -p80:3838 myShinyApp`

You can know access your app on: http://localhost/

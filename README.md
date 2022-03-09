# radicale-container

Build radicale on top of a RHEL Python image

## TLS Keys

Mount a `tls.key` and `tls.crt` in `/opt/app-root/etc/radicale/tls`.

The TLS keys are auto generated if none are mounted in.

`tls.{key,crt}` where chosen to make it easier to leverage autogenerated certs
in OpenShift.

## Users

Mount a `users` httpasswd file using bcrypt at
`/opt/app-root/etc/radicale/users`.

If one isn't mounted in, one with a user `user:password` will be generated.
Make sure to mount one there! Don't use the defaults in production.

## Published Image

I have a version published at `quay.io/lupnix/radicale` but I recommend you
build your own image. My image is for personal use and could be removed
at any point.

## Make Targets

### `build`

Build the image.

### `run`

Run the image locally.

### `debug`

Run the image locally, using bash as the entrypoint.

### `publish`

Publish the image to `quay.io/lupnix/radicale`

### `security-report`

Check the deps for vulnerabilities

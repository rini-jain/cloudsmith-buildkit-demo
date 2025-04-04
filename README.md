Approach Taken for Secure Solution:

I shifted to using Docker BuildKit, which allows securely injecting secrets during build time using --mount=type=secret.

The Cloudsmith token was stored in a local file and passed into the build context securely.

Inside the Docker build, the token was read temporarily using a mounted secret file and used in the HTTP request via an Authorization header.

This method ensures the token:

Is not stored in the image

Does not appear in Docker history or logs

Is only available during the specific RUN step
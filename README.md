Your team members want to collaborate on your NodeJS application, where you list developers with their associated projects. So they ask you to set up a git repository for it.

Also, you think it's a good idea to add tests to the process, to test that no one accidentally breaks the existing code.

Moreover, you all decide every change should be immediately built and pushed to the Docker repository, so everyone can access it right away.

For that they ask you to set up a continuous integration pipeline.



Step    1: Dockerize your NodeJS App
Configure your application to be built as a Docker image.
Dockerize your NodeJS app


Step 2: Create a full pipeline for your NodeJS App
You want the following steps to be included in your pipeline:

Increment version
The application's version and docker image version should be incremented.

TIP: Ensure to add —no-git-tag-version to the npm version minor command in your Jenkinsfile to avoid any commit errors

Run tests
You want to test the code, to be sure to deploy only working code. When tests fail, the pipeline should abort.

Build docker image with incremented version
Push to Docker repository
Commit to Git
The application version increment must be committed and pushed to a remote Git repository.



Step 3: Manually deploy new Docker Image on server
After the pipeline has run successfully, you:

Manually deploy the new docker image on the droplet server.

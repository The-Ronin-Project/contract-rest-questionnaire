# contract-rest-questionnaire

This project contains the OpenAPI contract for the Questionnaire Service.

# Versions

If you need to add a version 2 (or 3, etc.), put that version in a `v2` (or `v3`, etc.) directory under the root.

# Dependencies

To depend on _other_ contracts, you can reference them as project dependencies.  Make entries in your build.gradle.kts file like this:

```kotlin
val v1 by configurations.creating

dependencies {
    v1("<dependency group id>:<dependency artifact id>:<dependency version>")
}
```

When you run the commands described below, these dependencies will be downloaded and placed in the `vN/.dependencies` directory based on the version you declared in your build file.  If they
are archives, they'll be unzipped, and you can reference the dependent contracts, schemas, etc. directly by path from inside your OpenAPI schema.

## Running

In general, either run:

`./gradlew <COMMAND> <ARGUMENTS>`

or

`docker run --rm -it -v "$PWD:/app" -v "$HOME/.m2/repository:/home/ronin/host-repository" "docker-repo.devops.projectronin.io/ronin-contract-rest-tooling:<TAG>" gradle <COMMAND> <ARGUMENTS>`

Available commands are mostly general gradle commands.  Important ones are:

`incrementApiVersion [-Psnapshot=true|false] [-Pversion-increment=MINOR|PATCH|NONE]`: Increments the semantic versions of all API versions.  Optional
arguments determine if the tool puts a `-SNAPSHOT` on the end of thew version and what level of incrementing takes place.  Level `NONE` can be used to get
the tooling to remove an existing `-SNAPSHOT` suffix without making other changes.  The tool will _also_ make sure that the semantic version in each directory
matches the directory's major version number.

`check`: Verifies the contract using spectral tooling, making sure it's a valid contract.

`downloadApiDependencies`: downloads any API dependencies as specified in the `Dependencies` section above.

`build`: Runs `check`, generates schema documentation, and generates simple combined schema files.

`clean`: removes all generated files

`assemble`: Assembles the schema into deployable archives.

`publishToMavenLocal`: publishes all outputs to the local maven repo (e.g. `$HOME/.m2/repository`).  If you are using the docker image, it will try and
copy files in and out of the host's repository directory so they can be used for builds later on the host.

`publish`: publishes all outputs to the remote Ronin maven repository.

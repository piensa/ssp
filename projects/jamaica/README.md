
# Jamaica

This project is configured to download/prepare/build a complete Pelias installation for the country of Jamaica.


# Setup

Please refer to the instructions at https://github.com/pelias/docker in order to install and configure your docker environment.

The minimum configuration required in order to run this project are [installing prerequisites](https://github.com/pelias/docker#prerequisites), [install the pelias command](https://github.com/pelias/docker#installing-the-pelias-command) and [configure the environment](https://github.com/pelias/docker#configure-environment).

Please ensure that's all working fine before continuing.

# Run a Build

To run a complete build, execute the following commands:

```bash
ssp compose pull
ssp elastic start
ssp elastic wait
ssp elastic create
ssp download all
ssp prepare all
ssp import all
ssp compose up
ssp test run
ssp import hydra
ssp import keto
ssp import oathkeeper
ssp postgres migrate
```

# Make an Example Query

You can now make queries against your new Pelias build:

http://localhost:4000/v1/search?text=kingston

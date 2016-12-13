How to build
---
`docker-compose build && docker-compose up`

How We Got Here
---
* There is a PR that adds header support and we need this
  * https://github.com/CastawayLabs/cachet-monitor/pull/40
* So I took that guys branch and started adding docker build code to it
* Had to figure out how to build this repo
* Docker build takes the config file and replaces the tokens with the
appropriate environmental config and creates a new file for each environment
* Made the Entrypoint the call to the main.go file, that way the command can
be the config file to use
* Checks were copy and pasted from uptime.drillintelligent.com into checks.md
* checks.md is divided into several sections on what checks were added where

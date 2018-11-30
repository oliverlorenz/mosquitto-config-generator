# mosquitto-config-generator

This is a generator for a simple mosquitto configuration. Users are maintained by `pass`.

## Motivation

I running some mosquitto mqtt brokers with a simple configuration stucture based on the default configuration of mosquitto. Additional to that I several users on that broker. I decided to use `pass` as the single point of truth for passwords and ACL configuration.

## Prerequirements

* pass
* envsubst

## Usage

1. there should be a seperated directory for all your users. Example:

```
pass/broker/
  admin
  user1
  user2
```

2. the user password file should be follow this structure:

```
<YOURE_SECRET_PASSWORD>
readwrite user1/#
read $SYS/#
```

* first line should be password
* all additional line have to be in the [acl format mosquitto](https://mosquitto.org/man/mosquitto-conf-5.html) defines

3. run `./generate-all.sh pass/broker <BROKER_HOSTNAME> /tmp && ls -la /tmp/mosquitto.*`

It have generated 3 files. These you can use to configure your mosquitto
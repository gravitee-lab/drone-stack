# Drone CI integration with Git Service Provider

This integration is based on webhooks, which require TLS communication.

Therefore :
* The `git.pegasusio.io` cert msut have a CA trusted by `drone.oegasusio.io`, and the other way around
* Indeed here is the error that happens and reported by `Gitea`, because `Drone` discarded the webhook, set by Gitea :

![WEBHOOK_ERROR_DUE_TO_UNKNOWN_CERTIFICATE_AUTORITY](./documentation/images/screenshots/WEBHOOK_ERROR_DUE_TO_UNKNOWN_CERTIFICATE_AUTORITY.png)

So basically, what we need here is the traefik cert dumper, and manage those certificates trust CAs, own CAs.

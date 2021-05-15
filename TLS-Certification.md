# Obtaining a TLS Certificate with Certbot (Running apache on ubuntu)

More info visit: https://letsencrypt.org/getting-started/

## 1. Install snapd

<code> sudo snap install core; sudo snap refresh core </code>


## 2. Install Certbot

<code> sudo snap install --classic certbot </code>

## 3. Prepare the Certbot command
Confirm that the certbot command can be run:

<code> sudo ln -s /snap/bin/certbot /usr/bin/certbot </code>

## Run Certbot

<code> sudo certbot --apache </code>

## Confirm that Certbot worked:
To confirm that your site is set up properly, visit https://yourwebsite.com/ in your browser and look for the lock icon in the URL bar.

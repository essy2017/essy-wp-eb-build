# README #

This project provides scripts for automating build and deployment of a WordPress 
application to AWS Elastic Beanstalk.

## Getting Started ##
- Replace the placeholder values in `assets/.ebextensions/env.config` with values for 
  your environment.
- Modify `assets/server-files/.htaccess` if needed.
- Make the `build.sh` and `deploy.sh` scripts executable: `chmod +x build.sh` and  
  `chmod +x deploy.sh`.
- Update the value for `wordpress_local` in `build.sh` to point to your local WordPress installation.

## Initializing Elastic Beanstalk ##
- Make sure you have the Elastic Beanstalk CLI installed.
- From the root of this project type `eb init` in the command line to reference your environment.
- Add the following to `.elasticbeanstalk/config.yml` after the `branch-defaults` section:

    deploy:
      artifact: artifact.zip

## Running the Scripts ##
- Run `./build.sh` to create a source bundle `artifact.zip`.
- Run `./deploy.sh` to create a source bundle and deploy to Elastic Beanstalk.
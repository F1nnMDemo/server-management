# Example for deploying using f1nnm/git-docker-manager

## Setup
### 1. Install Docker

### 2. Create a new network
It doesn't matter how it's called, just make sure, it's the same across your configuration files
```
docker network create <name>
```

### 3. Set up the Github Webhook
In your repository go to Settings > Webhooks and add a new one for the push event.
The URL of the webhook should be the one, where the git-docker-manager will later be running under.

### 4. Deploy your repo
Run the following command to clone the repository for the first time and get it up and running.
```
docker run -e REPOSITORY=F1nnM/server-management \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v gitdeploy:/app/cloned-repo/ \
  f1nnm/git-docker-manager:release-0.5.7 init
```
Replace `<repo>` with your repository, e.g. `F1nnM/server-management`

### 5. Debug issues
If you have any issues, because of a faulty configuration, follow the following steps:
#### 1. Update the configuration and push it to the repository
#### 2. Check if it updated automatically
If the running git-docker-manager was successfully notified, it'll attempt to deploy your new configuration and you are done.
#### 3. If not:
Kill all docker containers manually:
```
docker kill $(docker ps -q) && docker rm $(docker ps -a -q)
```
The run the command from step 4 again.
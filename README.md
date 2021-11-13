# Example for deploying using f1nnm/git-docker-manager

## Setup
### 1. Install Docker

### 2. Run init script
```
bash <(curl -s https://raw.githubusercontent.com/F1nnM/server-management/main/setup.sh)
```
### 3. Set up the Github Webhook
In your repository go to Settings > Webhooks and add a new one for the push event.
The URL of the webhook should be the one, where the git-docker-manager will later be running under.

### 4. If your repo is private:
If your repository is private, you need to add a Personal Auth Token (PAT) to the file "compose/management/docker-compose.yml" in line 18.

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

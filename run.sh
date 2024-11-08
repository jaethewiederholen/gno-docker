NO_LOCK_REQUIRED=true

. ./.env.sh
. ./.common.sh

# create log folders with the user permissions so it won't conflict with container permissions
mkdir -p logs/gnoland

# Build and run containers and network
echo "docker-compose.yml" > ${LOCK_FILE}

echo "${bold}*************************************"
echo "Gnoland Quickstart"
echo "*************************************${normal}"
echo "Start network"
echo "--------------------"

docker compose build
docker compose up



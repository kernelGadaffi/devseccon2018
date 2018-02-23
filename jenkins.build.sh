export IMG_NAME='kgmdb'  # Name your Docker image
export CTNR_NAME='kgmdb' # Name your Docker container (has to be unique)
export PORT='5550'      # Choose a port between 9001-9999 (has to be unique)

# Clean up
sudo docker kill ${CTNR_NAME} || true
sudo docker rm ${CTNR_NAME} || true
# Build
sudo docker build -t ${IMG_NAME} .
# Run
sudo docker run --network=isolated_nw \
-d  \
-p ${PORT}:3000 \
--name ${CTNR_NAME} \
${IMG_NAME}
FROM registry.access.redhat.com/ubi10/nodejs-22@sha256:11a7e442c26772f6c0e90f8a32b5c15d08686fd41a371ed92759ca4d19c66cf2

WORKDIR /app
USER 1001

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN chown -R 1001:1001 /app

COPY --chown=1001:0 package*.json ./

# Install dependencies
RUN npm install

COPY . .

CMD ["npm", "start"]

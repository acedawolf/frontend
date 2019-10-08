# We will be making two containers in one File
#First create the Node container
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Don't need to add CMD because we are just building the image

# Creating the Nginx file
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# CMD is not needed for the nginx image.
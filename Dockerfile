# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
# /app/build <--- all the stuff we care about
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


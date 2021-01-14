FROM node:14-slim as builder

WORKDIR /code
COPY . /code

RUN npm install
RUN npm run build

FROM nginx:1.19

COPY --from=builder /code/build /usr/share/nginx/html

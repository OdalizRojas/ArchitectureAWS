FROM node:16-alpine 
WORKDIR /app
RUN npx create-react-app my-app
WORKDIR /app/my-app
RUN npm run build
ENV NODE_ENV production
EXPOSE 3000
CMD [ "npx", "serve", "build" ]
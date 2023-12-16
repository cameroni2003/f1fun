FROM node:current-alpine3.17 as base
WORKDIR /usr/src/app
EXPOSE 4321

FROM base as dev
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci

COPY prisma/ prisma/
RUN npx prisma generate

COPY . .

CMD npm run dev -- --host



FROM base as prod 
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --omit=dev

COPY prisma/ prisma/
RUN npx prisma generate

COPY . .

CMD npm run build && npm run preview -- --host

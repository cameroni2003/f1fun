FROM node:current-alpine3.17 as base
WORKDIR /usr/src/app
EXPOSE 4321

FROM base as dev
COPY . .
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --include=dev \
    npx prisma generate

CMD npm run dev -- --host



# FROM base as dev
# COPY . .
# RUN --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     --mount=type=cache,target=/root/.npm \
#     npm ci --include=dev \
#     npx prisma generate
#
# CMD npm run build && npm run preview -- --host

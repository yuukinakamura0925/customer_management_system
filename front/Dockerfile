FROM node:12.18.3-alpine
# カレントワーキングディレクトリとして 'app' フォルダを指定する
WORKDIR /app
# パッケージリストの更新を行う
RUN apk update
# `package.json`をコピーする
COPY package.json .
# プロジェクトの依存ライブラリをインストールする
RUN npm install
# カレントワーキングディレクトリ(つまり 'app' フォルダ)にプロジェクトのファイルやフォルダをコピーする
COPY . .
RUN npm run build
EXPOSE 3000
CMD [ "http-server", "-p", "3000", "dist" ]





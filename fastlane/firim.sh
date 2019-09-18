#!/bin/bash

source ./.env

# 登陆 firim
fir login ${firim_token}

# 上传包到 firim 并生成二维码 并钉钉通知
fir publish ./beta/${scheme}.ipa -Q -D ${dt_access_token}

#!/bin/bash

readonly API_TOKEN="7913760658:AAG2mhtuQhZf6nmuCl_78MgpwE-Uai-ZXCU"
readonly USER_ID="1069680478"
readonly URL="https://api.telegram.org/bot$API_TOKEN/sendMessage"
readonly TEXT="FROM:+$CI_COMMIT_AUTHOR%0A%0AJOB: $CI_JOB_NAME%0A%0ASTATUS:+$CI_JOB_STATUS%0A%0APROJECT:+$CI_PROJECT_NAME"

curl -s -d "chat_id=$USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
